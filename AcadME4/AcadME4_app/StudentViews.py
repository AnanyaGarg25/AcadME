from time import localtime

from django.contrib import messages
from django.contrib.auth.decorators import login_required
from django.http import HttpResponseRedirect,HttpResponse
from django.shortcuts import render, get_object_or_404
from django.urls import reverse

from AcadME4_app.models import CustomUser

from AcadME4_app.models import Students,Subjects,Courses

from AcadME4_app.models import Attendance, AttendanceReport
from future.backports.datetime import datetime

from AcadME4_app.models import FeedBackStudent
from django.shortcuts import render, redirect, get_object_or_404
from django.contrib import messages
from django.contrib.auth.decorators import login_required
from django.utils.timezone import localtime

from AcadME4_app.models import NotificationStudent

from AcadME4_app.models import StudentResult

from AcadME4_app.models import AssignmentSubmission, Assignment
from django.shortcuts import render, redirect
from django.http import HttpResponseNotFound
from AcadME4_app.models import Students, Timetable
from django.http import JsonResponse
from AcadME4_app.models import Attendance, AttendanceReport
import calendar
import datetime


def student_home(request):
    student_obj = Students.objects.get(admin=request.user.id)

    # Attendance Data
    attendance_total = AttendanceReport.objects.filter(student_id=student_obj).count()
    attendance_present = AttendanceReport.objects.filter(student_id=student_obj, status=True).count()
    attendance_absent = AttendanceReport.objects.filter(student_id=student_obj, status=False).count()

    # Subjects Data
    course = Courses.objects.get(id=student_obj.course_id.id)
    subjects = Subjects.objects.filter(course_id=course).count()

    subject_name = []
    data_present = []
    data_absent = []

    subject_data = Subjects.objects.filter(course_id=student_obj.course_id)
    for subject in subject_data:
        attendance = Attendance.objects.filter(subject_id=subject.id)
        attendance_present_count = AttendanceReport.objects.filter(attendance_id__in=attendance, status=True,
                                                                   student_id=student_obj.id).count()
        attendance_absent_count = AttendanceReport.objects.filter(attendance_id__in=attendance, status=False,
                                                                  student_id=student_obj.id).count()

        subject_name.append(subject.subject_name)
        data_present.append(attendance_present_count)
        data_absent.append(attendance_absent_count)

    # ✅ Student Notifications Count
    student_notification_count = NotificationStudent.objects.filter(student_id=student_obj.id).count()

    return render(request, "student_template/student_home_template.html", {
        "total_attendance": attendance_total,
        "attendance_absent": attendance_absent,
        "attendance_present": attendance_present,
        "subjects": subjects,
        "data_name": subject_name,
        "data1": data_present,
        "data2": data_absent,
        "student_notification_count": student_notification_count,  # ✅ Add this to the template
    })

def student_view_attendance(request):
    student=Students.objects.get(admin=request.user.id)
    course=student.course_id
    # ✅ Fetch all subjects for the student
    subjects=Subjects.objects.filter(course_id=course)

    # ✅ Prepare subject list with lab info
    subject_list = []
    for subject in subjects:
        subject_list.append({
            "id": subject.id,
            "subject_name": subject.subject_name,
            "has_lab": subject.has_lab  # ✅ Include lab info
        })

    return render(request,"student_template/student_view_attendance.html",{"subjects":subject_list})


def get_attendance_data(request):
    student = Students.objects.get(admin=request.user.id)  # Get the logged-in student
    subject_id = request.GET.get('subject')
    month_year = request.GET.get('month')
    class_type = request.GET.get('class_type')  # ✅ Get class type from frontend

    if not subject_id or not month_year or not class_type:
        return JsonResponse({'error': 'Invalid request parameters'}, status=400)

    year, month = map(int, month_year.split('-'))
    last_day = calendar.monthrange(year, month)[1]

    start_date = datetime.date(year, month, 1)
    end_date = datetime.date(year, month, last_day)

    # ✅ Fetch attendance records for the given subject, date range, and class type
    attendance_records = Attendance.objects.filter(
        subject_id=subject_id,class_type=class_type, attendance_date__range=[start_date, end_date]
    ).order_by("attendance_date")  # ✅ Sort by date

    data = []
    seen_dates = set()  # ✅ Store already added dates

    for record in attendance_records:
        # Filter attendance reports for the logged-in student
        report = AttendanceReport.objects.filter(attendance_id=record, student_id=student).first()

        if report:
            attendance_date_str = record.attendance_date.strftime('%Y-%m-%d')
            if attendance_date_str in seen_dates:  # ✅ Avoid duplicate dates
                continue
            seen_dates.add(attendance_date_str)

            data.append({
                'date': attendance_date_str,
                'status': 'Present' if report.status else 'Absent'
            })

    return JsonResponse(sorted(data, key=lambda x: x["date"]), safe=False)  # ✅ Ensure sorted order


def student_feedback(request):
    staff_id=Students.objects.get(admin=request.user.id)
    feedback_data=FeedBackStudent.objects.filter(student_id=staff_id)
    return render(request,"student_template/student_feedback.html",{"feedback_data":feedback_data})

def student_feedback_save(request):
    if request.method!="POST":
        return HttpResponseRedirect(reverse("student_feedback"))
    else:
        feedback_msg=request.POST.get("feedback_msg")

        student_obj=Students.objects.get(admin=request.user.id)
        try:
            feedback=FeedBackStudent(student_id=student_obj,feedback=feedback_msg,feedback_reply="")
            feedback.save()
            messages.success(request,"Successfully Sent Feedback")
            return HttpResponseRedirect(reverse("student_feedback"))
        except:
            messages.error(request,"Failed to send Feedback")
            return HttpResponseRedirect(reverse("student_feedback"))

def student_profile(request):
    user=CustomUser.objects.get(id=request.user.id)
    student = Students.objects.get(admin=user)
    return render(request,"student_template/student_profile.html",{"user":user,"student":student})

@login_required
def student_notifications(request):
    student = get_object_or_404(Students, admin=request.user)
    notifications = NotificationStudent.objects.filter(student_id=student).order_by('-created_at')

    # Convert timestamps to local time
    for notification in notifications:
        notification.created_at = localtime(notification.created_at)

    unread_notifications_count = notifications.filter(is_read=False).count() if hasattr(NotificationStudent, 'is_read') else 0

    return render(request, 'student_template/student_notifications.html', {
        'notifications': notifications,
        'unread_notifications_count': unread_notifications_count
    })

def student_profile_save(request):
    if request.method!="POST":
        return HttpResponseRedirect(reverse("student_profile"))
    else:
        first_name=request.POST.get("first_name")
        last_name = request.POST.get("last_name")
        address = request.POST.get("address")
        password=request.POST.get("password")
        try:
            customuser=CustomUser.objects.get(id=request.user.id)
            customuser.first_name=first_name
            customuser.last_name = last_name
            if password!=None and password!="":
                customuser.set_password(password)
            customuser.save()

            student=Students.objects.get(admin=customuser)
            student.address=address
            student.save()
            messages.success(request, "Successfully Updated Profile")
            return HttpResponseRedirect(reverse("student_profile"))
        except:
            messages.error(request, "Failed to Update Profile")
            return HttpResponseRedirect(reverse("student_profile"))

def student_view_result(request):
    student=Students.objects.get(admin=request.user.id)
    studentresult=StudentResult.objects.filter(student_id=student.id)
    return render(request,"student_template/student_result.html",{"studentresult":studentresult})

@login_required
def student_view_assignments(request):
    try:
        student_obj = Students.objects.get(admin=request.user)  # Get student
    except Students.DoesNotExist:
        messages.error(request, "Student information not found.")
        return redirect("home")

    # Fetch assignments based on student's enrolled subjects
    assignments = Assignment.objects.filter(subject__course_id=student_obj.course_id)

    return render(
        request,
        "student_template/view_assignments.html",
        {"assignments": assignments}
    )

@login_required
def student_submit_assignment(request, assignment_id):
    try:
        student_obj = Students.objects.get(admin=request.user)
        assignment = Assignment.objects.get(id=assignment_id)
    except (Students.DoesNotExist, Assignment.DoesNotExist):
        messages.error(request, "Invalid request.")
        return redirect("student_view_assignments")

    if request.method == "POST":
        submission_file = request.FILES.get("submission_file")
        if submission_file and not submission_file.name.lower().endswith(".pdf"):
            messages.error(request, "Only PDF files are allowed.")
            return redirect("student_submit_assignment", assignment_id=assignment_id)

        # Save submission
        submission = AssignmentSubmission(
            assignment=assignment,
            student=student_obj,
            submission_file=submission_file
        )
        submission.save()

        messages.success(request, "Assignment submitted successfully!")
        return redirect("student_view_assignments")

    return render(
        request,
        "student_template/submit_assignment.html",
        {"assignment": assignment}
    )

from django.shortcuts import render, redirect
from django.http import HttpResponseNotFound

# Helper function to convert an integer to its ordinal representation.
def ordinal(n):
    if 11 <= (n % 100) <= 13:
        suffix = 'th'
    else:
        suffix = {1: 'st', 2: 'nd', 3: 'rd'}.get(n % 10, 'th')
    return str(n) + suffix

def student_timetable_view(request):
    if not request.user.is_authenticated:
        return redirect('login')

    try:
        student = Students.objects.get(admin=request.user)
    except Students.DoesNotExist:
        return HttpResponseNotFound("Student profile not found")

    # Fetch timetable entries for the student's course (excluding Tuesday)
    timetables = Timetable.objects.filter(course=student.course_id) \
        .exclude(day_of_week="Tuesday") \
        .select_related("subject", "course", "teacher") \
        .order_by("day_of_week", "start_time")

    # Define fixed time slots from 09:00 AM to 05:00 PM.
    fixed_time_slots = [
        {"key": "09:00", "label": "09:00 AM - 10:00 AM"},
        {"key": "10:00", "label": "10:00 AM - 11:00 AM"},
        {"key": "11:00", "label": "11:00 AM - 12:00 PM"},
        {"key": "12:00", "label": "12:00 PM - 01:00 PM"},
        {"key": "13:00", "label": "01:00 PM - 02:00 PM"},
        {"key": "14:00", "label": "02:00 PM - 03:00 PM"},
        {"key": "15:00", "label": "03:00 PM - 04:00 PM"},
        {"key": "16:00", "label": "04:00 PM - 05:00 PM"},
    ]
    time_slots = fixed_time_slots

    # Define allowed days (excluding Tuesday) – you can adjust the order as needed.
    allowed_days = ['Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday', 'Monday']

    # Initialize the timetable matrix: for each allowed day, create a dictionary with fixed slots set to None.
    timetable_matrix = { day: { slot["key"]: None for slot in time_slots } for day in allowed_days }

    # Populate the matrix: For an entry to appear, its start_time (formatted as "HH:MM") must exactly match one of the fixed slot keys.
    for entry in timetables:
        day = entry.day_of_week
        key = entry.start_time.strftime("%H:%M")
        if day in timetable_matrix:
            timetable_matrix[day][key] = entry
        else:
            print(f"Entry with day '{day}' is not in allowed_days.")

    context = {
        "timetable_matrix": timetable_matrix,
        "time_slots": time_slots,
    }
    return render(request, "student_template/student_timetable_view.html", context)
def college_gallery(request):
    """
    Renders the college achievements & gallery page.
    """
    # If you want to load images dynamically from the database,
    # query your Achievement model here and pass as context.
    return render(request, "student_template/college_gallery.html")

def student_about(request):
    return render(request, "student_template/college_about.html")
from django.shortcuts import render
from django.contrib.auth.decorators import login_required
from .models import Syllabus, Students, Staffs


@login_required
def view_syllabus_books(request):
        student = Students.objects.get(admin=request.user)

        # Get subjects the student is enrolled in
        student_subjects = Subjects.objects.filter(course_id=student.course_id)

        # Get syllabus files related to those subjects
        syllabus = Syllabus.objects.filter(subject__in=student_subjects)

        return render(request, "student_template/view_syllabus_books.html",
                      {"subjects": student_subjects, "syllabus": syllabus})

def student_subjects(request):
    student = Students.objects.get(admin=request.user)  # Get logged-in student
    subjects = Subjects.objects.filter(course_id=student.course_id)  # Get subjects of the student's course
    subject_count = subjects.count()  # Count total subjects

    return render(request, "student_template/student_subjects.html", {
        "subjects": subjects,
        "subject_count": subject_count
    })