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


def student_home(request):
    student_obj=Students.objects.get(admin=request.user.id)
    attendance_total=AttendanceReport.objects.filter(student_id=student_obj).count()
    attendance_present = AttendanceReport.objects.filter(student_id=student_obj,status=True).count()
    attendance_absent = AttendanceReport.objects.filter(student_id=student_obj,status=False).count()
    course=Courses.objects.get(id=student_obj.course_id.id)
    subjects = Subjects.objects.filter(course_id=course).count()
    subject_name = []
    data_present = []
    data_absent = []
    subject_data=Subjects.objects.filter(course_id=student_obj.course_id)
    for subject in subject_data:
        attendance=Attendance.objects.filter(subject_id=subject.id)
        attendance_present_count=AttendanceReport.objects.filter(attendance_id__in=attendance,status=True,student_id=student_obj.id).count()
        attendance_absent_count = AttendanceReport.objects.filter(attendance_id__in=attendance, status=False,student_id=student_obj.id).count()
        subject_name.append(subject.subject_name)
        data_present.append(attendance_present_count)
        data_absent.append(attendance_absent_count)

    return render(request,"student_template/student_home_template.html",{"total_attendance":attendance_total,"attendance_absent":attendance_absent,"attendance_present":attendance_present,"subjects":subjects,"data_name":subject_name,"data1":data_present,"data2":data_absent})
def student_view_attendance(request):
    student=Students.objects.get(admin=request.user.id)
    course=student.course_id
    subjects=Subjects.objects.filter(course_id=course)
    return render(request,"student_template/student_view_attendance.html",{"subjects":subjects})

def student_view_attendance_post(request):
    subject_id=request.POST.get("subject")
    start_date=request.POST.get("start_date")
    end_date = request.POST.get("end_date")
    start_data_parse=datetime.strptime(start_date, "%Y-%m-%d").date()
    end_data_parse=datetime.strptime(end_date, "%Y-%m-%d").date()
    subject_obj=Subjects.objects.get(id=subject_id)
    user_object=CustomUser.objects.get(id=request.user.id)
    stud_obj=Students.objects.get(admin=user_object)
    attendance=Attendance.objects.filter(attendance_date__range=(start_data_parse,end_data_parse),subject_id=subject_obj)
    print("Attendance records:", attendance)
    attendance_reports=AttendanceReport.objects.filter(attendance_id__in=attendance,student_id=stud_obj)
    print("Attendance Reports:", attendance_reports)
    return render(request,"student_template/student_attendance_data.html",{"attendance_reports":attendance_reports})


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

def student_timetable_view(request):
    if not request.user.is_authenticated:
        return redirect('login')

    try:
        # Retrieve the student profile using the admin field
        student = Students.objects.get(admin=request.user)
    except Students.DoesNotExist:
        return HttpResponseNotFound("Student profile not found")

    # Filter timetable entries based on the student's course.
    # Assumes that Timetable.course is linked to the Courses model,
    # and student.course_id refers to the course instance.
    timetables = Timetable.objects.filter(course=student.course_id) \
        .select_related("subject", "course", "teacher") \
        .order_by("day_of_week", "start_time")

    return render(request, "student_template/student_timetable_view.html", {"timetables": timetables})