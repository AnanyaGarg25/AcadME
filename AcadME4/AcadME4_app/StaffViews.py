import json

from django.contrib import messages
from django.contrib.auth.decorators import login_required
from django.core.serializers import serialize
from django.http import HttpResponse, JsonResponse, HttpResponseRedirect
from django.shortcuts import render, reverse, redirect, get_object_or_404

from AcadME4_app.models import Subjects, SessionYearModel
from django.views.decorators.csrf import csrf_exempt

from AcadME4_app.models import Students

from AcadME4_app.models import AttendanceReport

from AcadME4_app.models import Attendance

from AcadME4_app.models import FeedBackStaffs

from AcadME4_app.models import Staffs

from AcadME4_app.models import CustomUser

from AcadME4_app.models import Courses

from AcadME4_app.models import StudentResult

from AcadME4_app.models import Assignment

from AcadME4_app.models import NotificationStaffs
from django.http import JsonResponse
from AcadME4_app.models import Branch, Subjects, Courses, Staffs
from AcadME4_app.models import AssignmentSubmission
from django.shortcuts import render, redirect
from django.http import HttpResponseNotFound
from AcadME4_app.models import Staffs, Timetable

@csrf_exempt
def staff_home(request):
    # Fetch all subjects assigned to the staff
    subjects = Subjects.objects.filter(staff_id=request.user.id)
    subject_count = subjects.count()

    # Get unique course IDs for the subjects taught by the staff
    course_ids = subjects.values_list('course_id', flat=True).distinct()

    # Count students enrolled in those courses
    students_count = Students.objects.filter(course_id__in=course_ids).count()

    # Count total attendance records for the subjects
    attendance_count = Attendance.objects.filter(subject_id__in=subjects).count()

    # Fetch attendance data by subject
    subject_list = []
    attendance_list = []

    for subject in subjects:
        attendance_count_per_subject = Attendance.objects.filter(subject_id=subject.id).count()
        subject_list.append(subject.subject_name)
        attendance_list.append(attendance_count_per_subject)

    # Fetch students for attendance analysis
    students_attendance = Students.objects.filter(course_id__in=course_ids)
    notification_count = NotificationStaffs.objects.filter(staff_id=request.user.id).count()
    student_list = []
    student_list_attendance_present = []
    student_list_attendance_absent = []

    for student in students_attendance:
        attendance_present_count = AttendanceReport.objects.filter(student_id=student.id, status=True).count()
        attendance_absent_count = AttendanceReport.objects.filter(student_id=student.id, status=False).count()

        student_list.append(student.admin.username)
        student_list_attendance_present.append(attendance_present_count)
        student_list_attendance_absent.append(attendance_absent_count)

    # Render the template with the fetched data
    context = {
        "notification_count": notification_count,
        "students_count": students_count,
        "attendance_count": attendance_count,
        "subject_count": subject_count,
        "subject_list": subject_list,
        "attendance_list": attendance_list,
        "student_list": student_list,
        "present_list": student_list_attendance_present,
        "absent_list": student_list_attendance_absent
    }

    return render(request, "staff_template/staff_home_template.html", context)
@csrf_exempt
def staff_take_attendance(request):
    subjects = Subjects.objects.filter(staff_id=request.user.id).values("id", "subject_name", "has_lab")
    session_years=SessionYearModel.object.all()
    return render(request,"staff_template/staff_take_attendance.html",{"subjects":subjects,"session_years":session_years})

def staff_subjects(request):
    subjects = Subjects.objects.filter(staff_id=request.user.id)
    return render(request, "staff_template/staff_subjects.html", {"subjects": subjects})


@csrf_exempt
def get_students(request):
    subject_id = request.POST.get("subject")
    session_year = request.POST.get("session_year")
    branch_id = request.POST.get("branch")  # ✅ Get branch from request

    try:
        subject = Subjects.objects.select_related('course_id', 'branch_id').get(id=subject_id)
        session_model = SessionYearModel.object.get(id=session_year)
    except (Subjects.DoesNotExist, SessionYearModel.DoesNotExist):
        return JsonResponse({"error": "Invalid Subject or Session Year"}, status=400)

    students = Students.objects.filter(course_id=subject.course_id, session_year_id=session_model, branch_id=branch_id)  # ✅ Filter by branch

    list_data = []
    for student in students:
        data_small = {
            "id": student.admin.id,
            "name": f"{student.admin.first_name} {student.admin.last_name}",
            "roll_no": student.roll_no,
            "btbt_id": student.btbt_id
        }
        list_data.append(data_small)

    return JsonResponse(list_data, safe=False)



@csrf_exempt
def save_attendance_data(request):
    student_ids=request.POST.get("student_ids")
    subject_id=request.POST.get("subject_id")
    attendance_date= request.POST.get("attendance_date")
    session_year_id= request.POST.get("session_year_id")
    class_type = request.POST.get("class_type")  # Get theory/lab selection

   # print(data[0]['id'])
    try:
        subject_model = Subjects.objects.get(id=subject_id)
        session_model = SessionYearModel.object.get(id=session_year_id)
        json_sstudent = json.loads(student_ids)
        # Ensure class_type is valid
        if class_type not in ["theory", "lab"]:
            return HttpResponse("ERROR: Invalid class_type")

        print(
            f"Received Data - Subject: {subject_id}, Date: {attendance_date}, Session Year: {session_year_id}, Class Type: {class_type}")
        attendance=Attendance(subject_id=subject_model,attendance_date=attendance_date,session_year_id=session_model, class_type=class_type)

        attendance.save()


        for stud in json_sstudent:
            student=Students.objects.get(admin=stud['id'])
            attendance_report=AttendanceReport(student_id=student,attendance_id=attendance,status=stud['status'],class_type=class_type)
            attendance_report.save()
            print(f"Attendance Report Saved for Student: {student.admin.username}")

        return HttpResponse("OKAY")
    except Exception as e:
        print(f"Error while saving attendance: {str(e)}")
        return HttpResponse(f"ERROR: {str(e)}")
@csrf_exempt
def staff_subjects(request):
    subjects = Subjects.objects.filter(staff_id=request.user.id)
    return render(request, "staff_template/staff_subjects.html", {"subjects": subjects})
@csrf_exempt
def staff_update_attendance(request):
    subjects = Subjects.objects.filter(staff_id=request.user.id)
    session_years = SessionYearModel.object.all()
    return render(request,"staff_template/staff_update_attendance.html",{"subjects":subjects,"session_years":session_years})

@csrf_exempt
def get_attendance_dates(request):
    subject=request.POST.get("subject")
    session_year_id = request.POST.get("session_year_id")
    class_type = request.POST.get("class_type")  # Get theory/lab selection

    subject_obj=Subjects.objects.get(id=subject)
    session_year_obj = SessionYearModel.object.get(id=session_year_id)
    attendance=Attendance.objects.filter(subject_id=subject_obj,session_year_id=session_year_obj, class_type=class_type)
    attendance_obj=[]
    for attendance_single in attendance:
        data={"id":attendance_single.id,"attendance_date":str(attendance_single.attendance_date),"session_year_id":attendance_single.session_year_id.id}
        attendance_obj.append(data)

    return JsonResponse(json.dumps(attendance_obj),safe=False)

@csrf_exempt
def get_attendance_student(request):
    attendance_date = request.POST.get("attendance_date")
    class_type = request.POST.get("class_type")  # ✅ Get Theory/Lab selection
    try:
        attendance=Attendance.objects.get(id=attendance_date, class_type=class_type)

        attendance_data=AttendanceReport.objects.filter(attendance_id=attendance)
        list_data=[]
        for student in attendance_data:
            data_small = {"id": student.student_id.admin.id, "name": student.student_id.admin.first_name + " " + student.student_id.admin.last_name,"status":student.status,
                          "roll_no": student.student_id.roll_no, "btbt_id": student.student_id.btbt_id}
            list_data.append(data_small)
        return JsonResponse(json.dumps(list_data), content_type="application/json", safe=False)
    except Attendance.DoesNotExist:
            return HttpResponse("ERROR: No attendance record found for this date and class type")
    except Exception as e:
            return HttpResponse(f"ERROR: {str(e)}")

@csrf_exempt
def save_updateattendance_data(request):
    student_ids=request.POST.get("student_ids")
    attendance_date= request.POST.get("attendance_date")
    class_type = request.POST.get("class_type")  # ✅ Get Theory/Lab selection

    try:
        attendance = Attendance.objects.get(id=attendance_date, class_type=class_type)
        json_sstudent = json.loads(student_ids)
        for stud in json_sstudent:
            student=Students.objects.get(admin=stud['id'])
            attendance_report=AttendanceReport.objects.get(student_id=student,attendance_id=attendance,class_type=class_type)
            attendance_report.status=stud['status']
            attendance_report.save()
        return HttpResponse("OKAY")
    except:
        return HttpResponse("ERROR")

def staff_feedback(request):
    staff_id=Staffs.objects.get(admin=request.user.id)
    feedback_data=FeedBackStaffs.objects.filter(staff_id=staff_id)
    return render(request,"staff_template/staff_feedback.html",{"feedback_data":feedback_data})

def staff_feedback_save(request):
    if request.method!="POST":
        return HttpResponseRedirect(reverse("staff_feedback_save"))
    else:
        feedback_msg=request.POST.get("feedback_msg")

        staff_obj=Staffs.objects.get(admin=request.user.id)
        try:
            feedback=FeedBackStaffs(staff_id=staff_obj,feedback=feedback_msg,feedback_reply="")
            feedback.save()
            messages.success(request,"Successfully Sent Feedback")
            return HttpResponseRedirect(reverse("staff_feedback"))
        except:
            messages.error(request,"Failed to send Feedback")
            return HttpResponseRedirect(reverse("staff_feedback"))

def staff_profile(request):
    user=CustomUser.objects.get(id=request.user.id)
    staff = Staffs.objects.get(admin=user)
    return render(request,"staff_template/staff_profile.html",{"user":user,"staff":staff})

def staff_profile_save(request):
    if request.method!="POST":
        return HttpResponseRedirect(reverse("staff_profile"))
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

            staff=Staffs.objects.get(admin=customuser.id)
            staff.address=address
            staff.save()
            messages.success(request, "Successfully Updated Profile")
            return HttpResponseRedirect(reverse("staff_profile"))
        except:
            messages.error(request, "Failed to Update Profile")
            return HttpResponseRedirect(reverse("staff_profile"))
@csrf_exempt
def staff_add_result(request):
    subjects=Subjects.objects.filter(staff_id=request.user.id)
    session_years = SessionYearModel.object.all()
    return render(request,"staff_template/staff_add_result.html",{"subjects":subjects,"session_years":session_years})
@csrf_exempt
def save_student_result(request):
    if request.method!='POST':
        return HttpResponseRedirect('staff_add_result')
    #student_admin_id=request.POST.get('student_list')
    #assignment_marks=request.POST.get('assignment_marks')
    #exam_marks=request.POST.get('exam_marks')
    subject_id=request.POST.get('subject')

    #student_obj=Students.objects.get(admin=student_admin_id)
    subject_obj=Subjects.objects.get(id=subject_id)

    '''try:
        check_exist=StudentResult.objects.filter(subject_id=subject_obj,student_id=student_obj).exists()
        if check_exist:
            result=StudentResult.objects.get(subject_id=subject_obj,student_id=student_obj)
            result.subject_assignment_marks=assignment_marks
            result.subject_exam_marks=exam_marks
            result.save()
            messages.success(request, "Successfully Updated Result")
            return HttpResponseRedirect(reverse("staff_add_result"))
        else:
            result=StudentResult(student_id=student_obj,subject_id=subject_obj,subject_exam_marks=exam_marks,subject_assignment_marks=assignment_marks)
            result.save()
            messages.success(request, "Successfully Added Result")
            return HttpResponseRedirect(reverse("staff_add_result"))
    except:
        messages.error(request, "Failed to Add Result")
        return HttpResponseRedirect(reverse("staff_add_result"))'''
    try:
        for key, value in request.POST.items():
            if key.startswith('assignment1_'):
                student_id = key.split('_')[1]
                student_obj = Students.objects.get(admin=student_id)

                # Get marks values, converting empty inputs to None or 0
                assignment1_marks = request.POST.get(f'assignment1_{student_id}')
                assignment2_marks = request.POST.get(f'assignment2_{student_id}')
                periodical1_marks = request.POST.get(f'periodical1_{student_id}')
                periodical2_marks = request.POST.get(f'periodical2_{student_id}')

                # Convert empty values to None or 0
                assignment1_marks = float(assignment1_marks) if assignment1_marks else None
                assignment2_marks = float(assignment2_marks) if assignment2_marks else None
                periodical1_marks = float(periodical1_marks) if periodical1_marks else None
                periodical2_marks = float(periodical2_marks) if periodical2_marks else None

                # Check if the result already exists
                result, created = StudentResult.objects.get_or_create(
                    student_id=student_obj,
                    subject_id=subject_obj
                )

                # Update fields only if values are provided
                if assignment1_marks is not None:
                    result.assignment1_marks = assignment1_marks
                if assignment2_marks is not None:
                    result.assignment2_marks = assignment2_marks
                if periodical1_marks is not None:
                    result.periodical1_marks = periodical1_marks
                if periodical2_marks is not None:
                    result.periodical2_marks = periodical2_marks

                result.save()

        messages.success(request, "Successfully Added Results")
        return HttpResponseRedirect(reverse("staff_add_result"))
    except:
        messages.error(request, "Failed to Add Results")
        return HttpResponseRedirect(reverse("staff_add_result"))

@login_required
def staff_notifications(request):
    """Display notifications for staff members"""

    staff = get_object_or_404(Staffs, admin=request.user)  # Get the staff linked to the logged-in user
    notifications = NotificationStaffs.objects.filter(staff_id=staff).order_by('-created_at')  # Fetch staff notifications

    return render(request, 'staff_template/staff_notifications.html', {
        'notifications': notifications
    })

@csrf_exempt
def staff_upload_assignment(request):
    if request.user.user_type != "2":  # Ensure only staff can upload
        messages.error(request, "Unauthorized access.")
        return redirect("home")
    try:
        staff_obj = Staffs.objects.get(admin=request.user)# Get the related Staffs object

    except Staffs.DoesNotExist:
        messages.error(request, "Staff information not found.")
        return redirect("home")


    subjects = Subjects.objects.filter(staff_id=staff_obj.admin)  # Get subjects assigned to staff

    if request.method == "POST":
        title = request.POST.get("title")
        description = request.POST.get("description")
        subject_id = request.POST.get("subject")
        assignment_file = request.FILES.get("assignment_file")
        due_date = request.POST.get("due_date")

        # Validate subject
        try:
            subject = Subjects.objects.get(id=subject_id, staff_id=staff_obj.admin)
        except Subjects.DoesNotExist:
            messages.error(request, "Invalid subject selection.")
            return redirect("staff_upload_assignment")

        # Validate file type (only PDFs allowed)
        if assignment_file:
            if not assignment_file.name.lower().endswith(".pdf"):
                messages.error(request, "Only PDF files are allowed.")
                return redirect("staff_upload_assignment")

        # Save assignment
        assignment = Assignment(
            title=title,
            description=description,
            subject=subject,
            assignment_file=assignment_file,
            due_date=due_date,
            staff=staff_obj
        )
        assignment.save()

        messages.success(request, "Assignment uploaded successfully.")
        return redirect("staff_upload_assignment")  # Redirect after success

    '''if request.method == "POST":
        form = AssignmentUploadForm(request.POST, request.FILES)
        if form.is_valid():
            assignment = form.save(commit=False)

            # Ensure the subject selected belongs to the staff
            if assignment.subject not in subjects:
                messages.error(request, "You can only upload assignments for subjects you teach.")
                return redirect("staff_upload_assignment")

            assignment.staff = request.user  # Link assignment to staff
            assignment.save()
            messages.success(request, "Assignment uploaded successfully.")
            return redirect("staff_dashboard")  # Redirect to staff dashboard
        else:
            messages.error(request, "Error in uploading assignment.")
    else:
        form = AssignmentUploadForm()'''
    return render(request, "staff_template/upload_assignment.html", {"subjects": subjects})

@csrf_exempt
def fetch_result_student(request):
    subject_id = request.POST.get('subject_id')
    student_id = request.POST.get('student_id')

    try:
        student_obj = Students.objects.get(admin=student_id)
        result = StudentResult.objects.filter(student_id=student_obj.id, subject_id=subject_id).first()

        if result:
            result_data = {
                "assignment1_marks": result.assignment1_marks if result.assignment1_marks is not None else None,
                "assignment2_marks": result.assignment2_marks if result.assignment2_marks is not None else None,
                "periodical1_marks": result.periodical1_marks if result.periodical1_marks is not None else None,
                "periodical2_marks": result.periodical2_marks if result.periodical2_marks is not None else None,
            }
            return JsonResponse(result_data)  # Return JSON response

        else:
            return JsonResponse({"error": "No result found"}, status=404)

    except Students.DoesNotExist:
        return JsonResponse({"error": "Student not found"}, status=404)
    except Exception as e:
        return JsonResponse({"error": str(e)}, status=500)


@login_required
def staff_view_submissions(request):
    try:
        staff_obj = Staffs.objects.get(admin=request.user)
    except Staffs.DoesNotExist:
        messages.error(request, "Staff information not found.")
        return redirect("home")

    submissions = AssignmentSubmission.objects.filter(assignment__staff=staff_obj)

    return render(
        request,
        "staff_template/view_submissions.html",
        {"submissions": submissions}
    )
'''
@login_required
def staff_grade_submission(request, submission_id):
    try:
        submission = AssignmentSubmission.objects.get(id=submission_id)
    except AssignmentSubmission.DoesNotExist:
        messages.error(request, "Submission not found.")
        return redirect("staff_view_submissions")

    if request.method == "POST":
        marks = request.POST.get("marks")
        feedback = request.POST.get("feedback")
        submission.marks_obtained = marks
        submission.feedback = feedback
        submission.status = "Graded"
        submission.save()
        messages.success(request, "Submission graded successfully.")
        return redirect("staff_view_submissions")

    return render(
        request,
        "staff_template/grade_submission.html",
        {"submission": submission}
    )
'''

from django.shortcuts import render, redirect
from django.http import HttpResponseNotFound

# Helper function to convert an integer to its ordinal representation.
def ordinal(n):
    if 11 <= (n % 100) <= 13:
        suffix = 'th'
    else:
        suffix = {1: 'st', 2: 'nd', 3: 'rd'}.get(n % 10, 'th')
    return str(n) + suffix
from django.shortcuts import render, redirect
from django.http import HttpResponseNotFound
from .models import Students, Timetable, Staffs

def staff_view_timetable(request):
    if not request.user.is_authenticated:
        return redirect('login')

    try:
        # Fetch the Staffs instance for the logged‑in user.
        staff_instance = Staffs.objects.get(admin=request.user)
    except Staffs.DoesNotExist:
        return HttpResponseNotFound("Staff profile not found")

    # Filter timetable entries for this teacher; exclude Tuesday.
    # We use select_related to prefetch subject, course, teacher, and the branch (via subject__branch_id).
    timetables = Timetable.objects.filter(teacher=staff_instance) \
        .exclude(day_of_week="Tuesday") \
        .select_related("subject", "course", "teacher", "subject__branch_id") \
        .order_by("day_of_week", "start_time")

    # Annotate each timetable entry with branch_name (if available)
    for entry in timetables:
        if entry.subject and entry.subject.branch_id:
            entry.branch_name = entry.subject.branch_id.name
        else:
            entry.branch_name = ""

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

    # Define allowed days (excluding Tuesday).
    allowed_days = ['Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday', 'Monday']

    # Initialize the timetable matrix: For each allowed day, create a dictionary with each fixed slot key set to None.
    timetable_matrix = {day: {slot["key"]: None for slot in time_slots} for day in allowed_days}

    # Populate the matrix with timetable entries.
    # Each entry's start_time (formatted as "HH:MM") must match one of the fixed slot keys.
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
    return render(request, "staff_template/staff_view_timetable.html", context)
def staff_gallery(request):
    """
    Renders the staff achievements & gallery page.
    """
    return render(request, "staff_template/staff_gallery.html")
from django.shortcuts import render, redirect
from django.contrib import messages
from .models import Syllabus, Subjects, Staffs
from django.contrib.auth.decorators import login_required
@login_required
def upload_syllabus_books(request):
    staff = Staffs.objects.get(admin=request.user)  # Get the logged-in teacher

    if request.method == "POST":
        title = request.POST.get("title")
        subject_id = request.POST.get("subject")
        file = request.FILES.get("syllabus_file")

        if not title or not file:
            messages.error(request, "All fields are required.")
            return redirect("upload_syllabus_books")

        try:
            # Filter subjects using `staff.admin` (which is a `CustomUser` instance)
            subject = Subjects.objects.get(id=subject_id, staff_id=staff.admin)
            syllabus = Syllabus(title=title, subject=subject, file=file, uploaded_by=staff)
            syllabus.save()
            messages.success(request, "Syllabus uploaded successfully!")
        except Subjects.DoesNotExist:
            messages.error(request, "Invalid subject selected.")

    # Filter subjects using `staff.admin`
    subjects = Subjects.objects.filter(staff_id=staff.admin)

    return render(request, "staff_template/upload_syllabus_books.html", {"subjects": subjects})

def staff_about(request):
    return render(request, "staff_template/staff_about.html")
@csrf_exempt
def get_branches(request, course_id):
    """ Fetch only branches where the logged-in teacher teaches subjects """
    try:
        teacher = Staffs.objects.get(admin=request.user)  # ✅ Ensure Staffs object

        # Get branches where the teacher has subjects under the selected course
        branches = Branch.objects.filter(
            subjects__staff_id=teacher.admin, subjects__course_id=course_id
        ).distinct().values("id", "name")

        return JsonResponse(list(branches), safe=False)

    except Staffs.DoesNotExist:
        return JsonResponse({"error": "Staff record not found"}, status=400)
@csrf_exempt
def get_subjects(request, branch_id):
    """ Fetch subjects of the selected branch that are taught by the logged-in teacher. """
    try:
        teacher = Staffs.objects.get(admin=request.user)  # ✅ Ensure Staffs object

        subjects = Subjects.objects.filter(
            staff_id=teacher.admin,  # Only subjects assigned to this teacher
            branch_id=branch_id      # Only subjects in the selected branch
        ).values("id", "subject_name","has_lab")

        return JsonResponse(list(subjects), safe=False)

    except Staffs.DoesNotExist:
        return JsonResponse({"error": "Staff record not found"}, status=400)
@csrf_exempt
def get_teacher_courses(request):
    """ Fetch courses assigned to the logged-in teacher """
    try:
        teacher = Staffs.objects.get(admin=request.user)  # ✅ Ensure Staffs object

        courses = Courses.objects.filter(
            subjects__staff_id=teacher.admin  # Only courses where this teacher teaches
        ).distinct().values("id", "course_name")

        return JsonResponse(list(courses), safe=False)

    except Staffs.DoesNotExist:
        return JsonResponse({"error": "Staff record not found"}, status=400)


from django.conf import settings
from django.http import JsonResponse
from .models import AssignmentSubmission, Staffs

@login_required
def get_filtered_submissions(request, subject_id):
    """Fetch student submissions for a given subject taught by the logged-in teacher"""
    try:
        staff_obj = Staffs.objects.get(admin=request.user)
        submissions = AssignmentSubmission.objects.filter(
            assignment__subject_id=subject_id,
            assignment__staff=staff_obj
        ).values(
            "id", "assignment__title", "student__admin__username",
            "submitted_at", "status", "submission_file"
        )

        submission_list = [
            {
                "id": sub["id"],
                "assignment_title": sub["assignment__title"],
                "student_username": sub["student__admin__username"],
                "submitted_at": sub["submitted_at"].strftime('%Y-%m-%d %H:%M:%S'),  # Format datetime
                "status": sub["status"],
                "file_url": settings.MEDIA_URL + str(sub["submission_file"])  # ✅ Ensure correct path
            }
            for sub in submissions
        ]

        return JsonResponse(submission_list, safe=False)

    except Staffs.DoesNotExist:
        return JsonResponse({"error": "Staff record not found"}, status=400)

@csrf_exempt
def get_session_years(request):
    session_years = SessionYearModel.object.all().values("id", "session_start_year", "session_end_year")
    return JsonResponse(list(session_years), safe=False)