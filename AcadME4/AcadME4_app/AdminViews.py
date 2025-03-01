import json

from django.contrib import messages
from django.core.files.storage import FileSystemStorage
from django.shortcuts import render, redirect
from django.http import HttpResponse, HttpResponseRedirect, JsonResponse
from django.urls import reverse
from AcadME4_app.models import CustomUser,Courses,Subjects,Staffs,Students
from django.core.files.storage import FileSystemStorage
from AcadME4_app.forms import AddStudentForm,EditStudentForm
import json
from datetime import datetime
from django.http import JsonResponse
from django.shortcuts import render
from django.views.decorators.csrf import csrf_exempt
from AcadME4_app.models import CustomUser, Subjects, Courses, Timetable, Staffs

from AcadME4_app.models import SessionYearModel,Branch
from django.views.decorators.csrf import csrf_exempt


from AcadME4_app.models import Attendance
from AcadME4_app.models import FeedBackStudent , FeedBackStaffs

from AcadME4_app.models import AttendanceReport

from AcadME4_app.models import NotificationStaffs, NotificationStudent

from django.contrib import messages
from django.utils.timezone import now
def admin_home(request):
    student_count = Students.objects.all().count()  # ✅ Correct total student count
    staff_count = Staffs.objects.all().count()
    subject_count = Subjects.objects.all().count()
    course_count = Courses.objects.all().count()

    course_all = Courses.objects.all()
    course_name_list = []
    subject_count_list = []
    student_count_list_in_course = []

    for course in course_all:
        subjects = Subjects.objects.filter(course_id=course.id).count()
        students = Students.objects.filter(course_id=course.id).count()
        course_name_list.append(course.course_name)
        subject_count_list.append(subjects)
        student_count_list_in_course.append(students)

    subjects_all = Subjects.objects.all()
    subject_list = []
    student_count_list_in_subject = []

    for subject in subjects_all:
        course = Courses.objects.get(id=subject.course_id.id)
        student_count_in_subject = Students.objects.filter(course_id=course.id).count()  # ✅ Fix variable name
        subject_list.append(subject.subject_name)
        student_count_list_in_subject.append(student_count_in_subject)

    context = {
        'student_count': student_count,  # ✅ Now this will always be correct
        'staff_count': staff_count,
        'subject_count': subject_count,
        'course_count': course_count,
        'course_name_list': course_name_list,
        'subject_count_list': subject_count_list,
        'student_count_list_in_course': student_count_list_in_course,
        'subject_list': subject_list,
        'student_count_list_in_subject': student_count_list_in_subject,
    }

    return render(request, 'admin_template/home_content.html', context)
def add_staff(request):
    return render(request,"admin_template/add_staff_template.html")
def add_staff_save(request):
    if request.method!="POST":
        return HttpResponse("Method Not Allowed")
    else:
        first_name=request.POST.get("first_name")
        last_name=request.POST.get("last_name")
        username=request.POST.get("username")
        teacher_id=request.POST.get("teacher_id")
        email=request.POST.get("email")
        password=request.POST.get("password")
        address=request.POST.get("address")
        gender = request.POST.get("gender")
        try:
            user=CustomUser.objects.create_user(username=username,password=password,email=email,last_name=last_name,first_name=first_name,user_type=2)
            user.staffs.address=address
            user.staffs.teacher_id=teacher_id
            user.staffs.gender = gender
            user.save()
            messages.success(request,"Successfully Added Staff")
            return HttpResponseRedirect(reverse("add_staff"))
        except:
            messages.error(request,"Failed to Add Staff")
            return HttpResponseRedirect(reverse("add_staff"))

def add_course(request):
    return render(request, "admin_template/add_course_template.html")
def add_course_save(request):
    if request.method!="POST":
        return HttpResponse("Method Not Allowed")
    else:
        course=request.POST.get("course")
        try:
            course_model=Courses(course_name=course)
            course_model.save()
            messages.success(request,"Successfully Added Course")
            return HttpResponseRedirect(reverse("add_course"))
        except:
            messages.error(request,"Failed To Add Course")
            return HttpResponseRedirect(reverse("add_course"))

def add_branch(request):
    courses = Courses.objects.all()  # Fetch all available courses
    print(courses)
    return render(request, 'admin_template/add_branch.html', {'courses': courses})

@csrf_exempt
def get_branches_by_course(request):
    course_id = request.POST.get("course_id")
    print(course_id)
    branches = Branch.objects.filter(course_id=course_id).values("id", "name")
    # Get branches for selected course
    return JsonResponse(list(branches), safe=False)

def add_branch_save(request):
    if request.method!= "POST":
        return HttpResponse("<h2>Method Not Allowed</h2>")
    else:
        course_id = request.POST.get("course")
        course = Courses.objects.get(id=course_id)
        name= request.POST.get("branch_name")

        try:
            branch = Branch(name=name,course_id=course)
            branch.save()
            messages.success(request, "Successfully Added Branch")
            return HttpResponseRedirect(reverse("add_branch"))
        except:
            messages.error(request, "Failed to Add Branch")
            return HttpResponseRedirect(reverse("add_branch"))



def add_student(request):
    form = AddStudentForm()
    courses = Courses.objects.all()
    return render(request,"admin_template/add_student_template.html",{"form":form,"courses":courses})

def add_student_save(request):
    if request.method!="POST":
        return HttpResponse("Method Not Allowed")
    else:
            form=AddStudentForm(request.POST,request.FILES)
            if form.is_valid():
                 first_name=form.cleaned_data["first_name"]
                 last_name=form.cleaned_data["last_name"]
                 btbt_id=form.cleaned_data["btbt_id"]
                 roll_no=form.cleaned_data["roll_no"]
                 username=form.cleaned_data["username"]
                 email=form.cleaned_data["email"]
                 password=form.cleaned_data["password"]
                 address=form.cleaned_data["address"]
                 session_year_id=form.cleaned_data["session_year_id"]
                 course_id=form.cleaned_data["course"]
                 branch_id=form.cleaned_data["branch"]
                 profile_pic=request.FILES['profile_pic']
                 fs=FileSystemStorage()
                 filename=fs.save(profile_pic.name,profile_pic)
                 profile_pic_url=fs.url(filename)

                 try:
                     user=CustomUser.objects.create_user(username=username,password=password,email=email,last_name=last_name,first_name=first_name,user_type=3)
                     user.students.roll_no = roll_no
                     user.students.btbt_id= btbt_id
                     user.students.address=address
                     course_obj=Courses.objects.get(id=course_id)
                     user.students.course_id=course_obj
                     user.students.branch_id = Branch.objects.get(id=branch_id)
                     session_year=SessionYearModel.object.get(id=session_year_id)
                     user.students.session_year_id=session_year
                     user.students.profile_pic=profile_pic_url
                     user.save()
                     messages.success(request,"Successfully Added Student")
                     return HttpResponseRedirect(reverse("add_student"))
                 except:
                    messages.error(request,"Failed to Add Student")
                    return HttpResponseRedirect(reverse("add_student"))
            else:
                form=AddStudentForm(request.POST)
                return render(request, "admin_template/add_student_template.html", {"form": form})

def add_subject(request):
    courses=Courses.objects.all()
    staffs=CustomUser.objects.filter(user_type=2)
    return render(request,"admin_template/add_subject_template.html",{"staffs":staffs,"courses":courses})


def add_subject_save(request):
    if request.method != "POST":
        return HttpResponse("<h2>Method Not Allowed</h2>")
    else:
        subject_name = request.POST.get("subject_name")
        subject_code = request.POST.get("subject_code")
        course_id = request.POST.get("course")
        branch_id = request.POST.get("branch")
        staff_id = request.POST.get("staff")

        try:
            course = Courses.objects.get(id=course_id)
            branch = Branch.objects.get(id=branch_id) if branch_id else None  # ✅ Fetch branch only if selected
            staff = CustomUser.objects.get(id=staff_id)

            # ✅ Ensure the subject is created with the selected branch
            subject = Subjects(
                subject_name=subject_name,
                subject_code=subject_code,
                course_id=course,
                branch_id=branch,  # ✅ Store branch
                staff_id=staff
            )
            subject.save()

            messages.success(request, "Successfully Added Subject")
            return HttpResponseRedirect(reverse("add_subject"))

        except Courses.DoesNotExist:
            messages.error(request, "Invalid Course Selected")
            return HttpResponseRedirect(reverse("add_subject"))

        except Branch.DoesNotExist:
            messages.error(request, "Invalid Branch Selected")
            return HttpResponseRedirect(reverse("add_subject"))

        except CustomUser.DoesNotExist:
            messages.error(request, "Invalid Staff Selected")
            return HttpResponseRedirect(reverse("add_subject"))

        except Exception as e:
            messages.error(request, f"Failed to Add Subject: {str(e)}")
            return HttpResponseRedirect(reverse("add_subject"))


def manage_staff(request):
        staffs = Staffs.objects.all()
        return render(request, "admin_template/manage_staff_template.html", {"staffs": staffs})

def manage_student(request):
    students=Students.objects.all()
    return render(request,"admin_template/manage_student_template.html",{"students":students})

def manage_course(request):
    courses=Courses.objects.all()
    return render(request,"admin_template/manage_course_template.html",{"courses":courses})


def manage_subject(request):
    subjects=Subjects.objects.all()
    return render(request,"admin_template/manage_subject_template.html",{"subjects":subjects})

def edit_staff(request,staff_id):
    staff=Staffs.objects.get(admin=staff_id)
    return render(request,"admin_template/edit_staff_template.html",{"staff":staff,"id":staff_id})

def edit_staff_save(request):
    if request.method!="POST":
        return HttpResponse("<h2>Method Not Allowed</h2>")
    else:
        staff_id=request.POST.get("staff_id")
        first_name=request.POST.get("first_name")
        last_name=request.POST.get("last_name")
        email=request.POST.get("email")
        teacher_id=request.POST.get("teacher_id")
        gender = request.POST.get("gender")
        username=request.POST.get("username")
        address=request.POST.get("address")

        try:
            user=CustomUser.objects.get(id=staff_id)
            user.first_name=first_name
            user.last_name=last_name
            user.email=email
            user.username=username
            user.gender = gender
            user.save()

            staff_model=Staffs.objects.get(admin=staff_id)
            staff_model.address=address
            staff_model.teacher_id =teacher_id
            staff_model.gender = gender
            staff_model.save()
            messages.success(request,"Successfully Edited Staff")
            return HttpResponseRedirect(reverse("edit_staff",kwargs={"staff_id":staff_id}))
        except:
            messages.error(request,"Failed to Edit Staff")
            return HttpResponseRedirect(reverse("edit_staff",kwargs={"staff_id":staff_id}))

def edit_student(request,student_id):

    request.session['student_id']=student_id
    student=Students.objects.get(admin=student_id)
    form=EditStudentForm()
    form.fields['email'].initial=student.admin.email
    form.fields['first_name'].initial=student.admin.first_name
    form.fields['last_name'].initial=student.admin.last_name
    form.fields['btbt_id'].initial=student.btbt_id
    form.fields['roll_no'].initial = student.roll_no
    form.fields['username'].initial=student.admin.username
    form.fields['address'].initial=student.address
    form.fields['course'].initial=student.course_id.id
    form.fields['branch'].initial=student.branch_id.id if student.branch_id else ""
    form.fields['session_year_id'].initial=student.session_year_id.id
    return render(request,"admin_template/edit_student_template.html",{"form":form,"id":student_id,"username":student.admin.username, "student_course_id": student.course_id.id,"student_branch_id": student.branch_id.id if student.branch_id else None })#{"username":student.admin.username})

def edit_student_save(request):
     if request.method!="POST":
       return HttpResponse("<h2>Method Not Allowed</h2>")
     else:
        student_id=request.session.get("student_id")
        if student_id==None:
            return HttpResponseRedirect(reverse("manage_student"))

        form=EditStudentForm(request.POST,request.FILES)
        if form.is_valid():
            first_name = form.cleaned_data["first_name"]
            last_name = form.cleaned_data["last_name"]
            username = form.cleaned_data["username"]
            roll_no= form.cleaned_data["roll_no"]
            btbt_id=form.cleaned_data["btbt_id"]
            email=form.cleaned_data["email"]
            address=form.cleaned_data["address"]
            session_year_id=form.cleaned_data["session_year_id"]
            course_id= form.cleaned_data["course"]
            branch_id = request.POST.get("branch")
            if request.FILES.get('profile_pic',False):
                 profile_pic = request.FILES['profile_pic']
                 fs = FileSystemStorage()
                 filename = fs.save(profile_pic.name, profile_pic)
                 profile_pic_url = fs.url(filename)
            else:
                profile_pic_url = None

            try:
                user = CustomUser.objects.get(id=student_id)
                user.first_name = first_name
                user.last_name = last_name
                user.username=username
                user.email = email
                user.save()
                student =Students.objects.get(admin=student_id)
                student.address = address
                student.roll_no = roll_no
                student.btbt_id=btbt_id
                session_year = SessionYearModel.object.get(id=session_year_id)
                student.session_year_id = session_year
                course=Courses.objects.get(id=course_id)
                student.course_id = course
                student.branch_id = Branch.objects.get(id=branch_id) if branch_id else None
                if profile_pic_url!=None:
                     student.profile_pic=profile_pic_url
                student.save()
                del request.session['student_id']
                messages.success(request, "Successfully Edited Student")
                return HttpResponseRedirect(reverse("edit_student",kwargs={"student_id":student_id}))
            except:
                 messages.error(request, "Failed to Edit Student")
                 return HttpResponseRedirect(reverse("edit_student",kwargs={"student_id":student_id}))
        else:
            form=EditStudentForm(request.POST)
            student=Students.objects.get(admin=student_id)
            return render(request,"admin_template/edit_student_template.html",{"form":form,"id":student_id,"username":student.admin.username })

def edit_subject(request,subject_id):
    subject=Subjects.objects.get(id=subject_id)

    courses=Courses.objects.all()
    branches = Branch.objects.filter(course_id=subject.course_id.id)
    staffs=CustomUser.objects.filter(user_type=2)
    return render(request,"admin_template/edit_subject_template.html",{"subject":subject,"staffs":staffs,"courses":courses, "branches": branches,"id": subject_id,"selected_course": subject.course_id.id,
        "selected_branch": subject.branch_id.id if subject.branch_id else None, })

def edit_subject_save(request):
    if request.method!="POST":
        return HttpResponse("<h2>Method Not Allowed</h2>")
    else:
        subject_id=request.POST.get("subject_id")
        subject_name=request.POST.get("subject_name")
        subject_code=request.POST.get("subject_code")
        staff_id=request.POST.get("staff")
        course_id=request.POST.get("course")
        branch_id = request.POST.get("branch")
        try:
            subject=Subjects.objects.get(id=subject_id)
            subject.subject_name=subject_name
            subject.subject_code=subject_code
            staff=CustomUser.objects.get(id=staff_id)
            subject.staff_id=staff
            course=Courses.objects.get(id=course_id)
            subject.branch_id = Branch.objects.get(id=branch_id) if branch_id else None
            subject.course_id=course
            subject.save()

            messages.success(request,"Successfully Edited Subject")
            return HttpResponseRedirect(reverse("edit_subject",kwargs={"subject_id":subject_id}))
        except:
            messages.error(request,"Failed to Edit Subject")
            return HttpResponseRedirect(reverse("edit_subject",kwargs={"subject_id":subject_id}))


def edit_course(request,course_id):
    course=Courses.objects.get(id=course_id)
    return render(request,"admin_template/edit_course_template.html",{"course":course,"id":course_id})

def edit_course_save(request):
    if request.method!="POST":
        return HttpResponse("<h2>Method Not Allowed</h2>")
    else:
        course_id=request.POST.get("course_id")
        course_name=request.POST.get("course")

        try:
            course=Courses.objects.get(id=course_id)
            course.course_name=course_name
            course.save()
            messages.success(request,"Successfully Edited Course")
            return HttpResponseRedirect(reverse("edit_course",kwargs={"course_id":course_id}))
        except:
            messages.error(request,"Failed to Edit Course")
            return HttpResponseRedirect(reverse("edit_course",kwargs={"course_id":course_id}))

def manage_session(request):
    return render(request,"admin_template/manage_session_template.html")

def add_session_save(request):
    if request.method != "POST":
        return HttpResponseRedirect(reverse("manage_session"))
    else:
        session_start_year=request.POST.get("session_start")
        session_end_year = request.POST.get("session_end")
        try:
            sessionyear=SessionYearModel(session_start_year=session_start_year,session_end_year=session_end_year)
            sessionyear.save()
            messages.success(request, "Successfully Added Session")
            return HttpResponseRedirect(reverse("manage_session"))
        except:
            messages.error(request, "Failed to Add Session")
            return HttpResponseRedirect(reverse("manage_session"))
@csrf_exempt
def check_email_exist(request):
    email=request.POST.get("email")
    user_obj=CustomUser.objects.filter(email=email).exists()
    if user_obj:
        return HttpResponse(True)
    else:
        return HttpResponse(False)

@csrf_exempt
def check_username_exist(request):
    username=request.POST.get("username")
    user_obj=CustomUser.objects.filter(username=username).exists()
    if user_obj:
        return HttpResponse(True)
    else:
        return HttpResponse(False)

def admin_profile(request):
    user=CustomUser.objects.get(id=request.user.id)
    return render(request,"admin_template/admin_profile.html",{"user":user})

def admin_profile_save(request):
    if request.method!="POST":
        return HttpResponseRedirect(reverse("admin_profile"))
    else:
        first_name=request.POST.get("first_name")
        last_name = request.POST.get("last_name")
        password=request.POST.get("password")
        try:
            customuser=CustomUser.objects.get(id=request.user.id)
            customuser.first_name=first_name
            customuser.last_name = last_name
            if password!=None and password!="":
                customuser.set_password(password)
            customuser.save()
            messages.success(request, "Successfully Updated Profile")
            return HttpResponseRedirect(reverse("admin_profile"))
        except:
            messages.error(request, "Failed to Update Profile")
            return HttpResponseRedirect(reverse("admin_profile"))

def admin_view_attendance(request):
    subjects = Subjects.objects.all()
    session_year_id = SessionYearModel.object.all()
    return render(request, "admin_template/admin_view_attendance.html",{"subjects": subjects, "session_year_id": session_year_id})

@csrf_exempt
def admin_get_attendance_dates(request):
    subject = request.POST.get("subject")
    session_year_id = request.POST.get("session_year_id")
    subject_obj = Subjects.objects.get(id=subject)
    session_year_obj = SessionYearModel.object.get(id=session_year_id)
    attendance = Attendance.objects.filter(subject_id=subject_obj, session_year_id=session_year_obj)
    attendance_obj = []
    for attendance_single in attendance:
        data = {"id": attendance_single.id, "attendance_date": str(attendance_single.attendance_date),
                "session_year_id": attendance_single.session_year_id.id}
        attendance_obj.append(data)

    return JsonResponse(json.dumps(attendance_obj), safe=False)

@csrf_exempt
def admin_get_attendance_student(request):
    attendance_date = request.POST.get("attendance_date")
    attendance = Attendance.objects.get(id=attendance_date)

    attendance_data = AttendanceReport.objects.filter(attendance_id=attendance)
    list_data = []

    for student in attendance_data:
        data_small = {"id": student.student_id.admin.id,
                      "name": student.student_id.admin.first_name + " " + student.student_id.admin.last_name,
                      "status": student.status}
        list_data.append(data_small)
    return JsonResponse(json.dumps(list_data), content_type="application/json", safe=False)

def staff_feedback_message(request):
    feedbacks = FeedBackStaffs.objects.all()
    return render(request, "admin_template/staff_feedback_template.html", {"feedbacks": feedbacks})


def student_feedback_message(request):
    feedbacks=FeedBackStudent.objects.all()
    return render(request,"admin_template/student_feedback_template.html",{"feedbacks":feedbacks})

@csrf_exempt
def student_feedback_message_replied(request):
    feedback_id=request.POST.get("id")
    feedback_message = request.POST.get("message")
    try:
        feedback=FeedBackStudent.objects.get(id=feedback_id)
        feedback.feedback_reply=feedback_message
        feedback.save()
        return HttpResponse("True")
    except:
        return HttpResponse("False")
@csrf_exempt
def staff_feedback_message_replied(request):
    feedback_id = request.POST.get("id")
    feedback_message = request.POST.get("message")
    try:
        feedback = FeedBackStaffs.objects.get(id=feedback_id)
        feedback.feedback_reply = feedback_message
        feedback.save()
        return HttpResponse("True")
    except:
        return HttpResponse("False")

def send_notification(request):
    if request.method == "POST":
        message = request.POST.get("message")
        recipient_type = request.POST.get("recipient_type")

        if recipient_type == "student":
            students = Students.objects.all()
            notifications = []

            for student in students:
                exists = NotificationStudent.objects.filter(student_id=student, message=message).exists()
                if not exists:
                    notifications.append(
                        NotificationStudent(student_id=student, message=message, created_at=now(), updated_at=now()))

            if notifications:
                NotificationStudent.objects.bulk_create(notifications)  # Bulk insert only new notifications

        elif recipient_type == "staff":
            staffs = Staffs.objects.all()
            notifications = []

            for staff in staffs:
                exists = NotificationStaffs.objects.filter(staff_id=staff, message=message).exists()
                if not exists:
                    notifications.append(
                        NotificationStaffs(staff_id=staff, message=message, created_at=now(), updated_at=now()))

            if notifications:
                NotificationStaffs.objects.bulk_create(notifications)  # Bulk insert only new notifications

        messages.success(request, "Notification sent successfully!")
        return redirect("send_notification")  # Redirect to prevent resubmission

    return render(request, "admin_template/send_notification.html")
from django.http import JsonResponse
from datetime import datetime
from .models import Attendance, AttendanceReport

def admin_get_monthly_attendance(request):
    if request.method == "POST":
        subject_id = request.POST.get("subject")
        session_year_id = request.POST.get("session_year_id")
        selected_month = request.POST.get("month")  # Expected format: YYYY-MM

        if not subject_id or not session_year_id or not selected_month:
            return JsonResponse({"error": "Missing data. Please select all fields."}, status=400)

        try:
            year, month = map(int, selected_month.split("-"))
        except ValueError:
            return JsonResponse({"error": "Invalid month format. Use YYYY-MM."}, status=400)

        attendance_records = Attendance.objects.filter(
            subject_id=subject_id,
            session_year_id=session_year_id,
            attendance_date__year=year,
            attendance_date__month=month
        )

        if not attendance_records.exists():
            return JsonResponse({"error": "No attendance data found for this month."}, status=404)

        total_classes = attendance_records.count()
        student_attendance = {}

        for record in attendance_records:
            reports = AttendanceReport.objects.filter(attendance_id=record)
            for report in reports:
                student_name = f"{report.student_id.admin.first_name} {report.student_id.admin.last_name}"
                if student_name not in student_attendance:
                    student_attendance[student_name] = {"attended": 0, "total": total_classes}
                if report.status:
                    student_attendance[student_name]["attended"] += 1

        student_data = []
        for student, data in student_attendance.items():
            student_data.append({
                "name": student,
                "attended_classes": data["attended"],
                "total_classes": data["total"],
                "status": data["attended"] > (data["total"] / 2)  # Green if attended more than 50%
            })

        return JsonResponse(student_data, safe=False)

def admin_timetable(request):
    """
    Render the timetable page with subjects, courses, and teachers.
    Only accessible to superusers.
    """
    if not request.user.is_superuser:
        return render(request, "error_page.html", {"error": "Access Denied"})

    # Fetch only the necessary fields (for initial rendering if needed)
    subjects = Subjects.objects.only("id", "subject_name")
    courses = Courses.objects.only("id", "course_name")
    teachers = Staffs.objects.select_related("admin").only("id", "admin__first_name", "admin__last_name")

    return render(request, "admin_template/admin_timetable.html", {
        "subjects": subjects,
        "courses": courses,
        "teachers": teachers
    })


def get_timetable_data(request):
    """
    Return JSON data for subjects, courses, teachers, and timetable entries.
    """
    subjects = list(Subjects.objects.values("id", "subject_name", "course_id", "staff_id"))
    courses = list(Courses.objects.values("id", "course_name"))

    teachers = list(Staffs.objects.select_related("admin").values(
        "id",
        "admin_id",
        "admin__first_name",
        "admin__last_name"
    ))

    timetable_entries = list(Timetable.objects.values(
        "id",
        "day_of_week",
        "start_time",
        "end_time",
        "course_id",
        "subject__subject_name",
        "course__course_name",
        "teacher__admin__first_name",
        "teacher__admin__last_name",
    ))

    formatted_timetable = []
    for entry in timetable_entries:
        start = entry["start_time"]
        end = entry["end_time"]
        start_str = start.strftime("%H:%M") if hasattr(start, "strftime") else start
        end_str = end.strftime("%H:%M") if hasattr(end, "strftime") else end

        first_name = entry.get("teacher__admin__first_name", "")
        last_name = entry.get("teacher__admin__last_name", "")
        teacher_name = f"{first_name} {last_name}".strip() or "Not Assigned"
        formatted_timetable.append({
            "id": entry["id"],
            "day_of_week": entry["day_of_week"],
            "start_time": start_str,
            "end_time": end_str,
            "course_id": entry["course_id"],
            "subject_name": entry["subject__subject_name"],
            "course_name": entry["course__course_name"],
            "teacher_name": teacher_name,
        })

    return JsonResponse({
        "subjects": subjects,
        "courses": courses,
        "teachers": teachers,
        "timetable": formatted_timetable
    })
from datetime import datetime
from django.http import JsonResponse
# ... your other imports ...

@csrf_exempt
def add_timetable_entry(request):
    """
    Create a new timetable entry from a JSON payload.
    Expects JSON with:
      - subject_id
      - course_id
      - teacher_id (Staffs id)
      - day_of_week
      - start_time (HH:MM)
      - end_time (HH:MM)
    """
    if request.method == "POST":
        try:
            data = json.loads(request.body.decode("utf-8"))
            subject_id = data.get("subject_id")
            course_id = data.get("course_id")
            teacher_id = data.get("teacher_id")
            day_of_week = data.get("day_of_week")
            start_time_str = data.get("start_time")
            end_time_str = data.get("end_time")

            if not (subject_id and course_id and teacher_id and day_of_week and start_time_str and end_time_str):
                return JsonResponse({"error": "All fields are required"}, status=400)

            try:
                start_time = datetime.strptime(start_time_str, "%H:%M").time()
                end_time = datetime.strptime(end_time_str, "%H:%M").time()
            except ValueError:
                return JsonResponse({"error": "Invalid time format. Use HH:MM"}, status=400)

            # Fetch related objects.
            subject = Subjects.objects.get(id=subject_id)
            course = Courses.objects.get(id=course_id)
            teacher = Staffs.objects.get(id=teacher_id)

            # Check if this teacher is already assigned on the same day at the same start_time.
            if Timetable.objects.filter(teacher=teacher, day_of_week=day_of_week, start_time=start_time).exists():
                return JsonResponse({"error": "This teacher is already assigned for that time slot on " + day_of_week}, status=400)

            # Create the timetable entry.
            new_entry = Timetable.objects.create(
                subject=subject,
                course=course,
                teacher=teacher,
                day_of_week=day_of_week,
                start_time=start_time,
                end_time=end_time,
            )
            return JsonResponse({"message": "Timetable entry added successfully"}, status=201)

        except json.JSONDecodeError:
            return JsonResponse({"error": "Invalid JSON format"}, status=400)
        except Subjects.DoesNotExist:
            return JsonResponse({"error": "Invalid subject ID"}, status=400)
        except Courses.DoesNotExist:
            return JsonResponse({"error": "Invalid course ID"}, status=400)
        except Staffs.DoesNotExist:
            return JsonResponse({"error": "Invalid teacher ID"}, status=400)
        except Exception as e:
            return JsonResponse({"error": str(e)}, status=500)

    return JsonResponse({"error": "Invalid request method"}, status=405)


def admin_gallery(request):
    """
    Renders the admin achievements & gallery page.
    """
    return render(request, "admin_template/admin_gallery.html")


def admin_about(request):
    # For initial testing, try returning a simple response:
    # return HttpResponse("Admin About view is working!")

    return render(request, "admin_template/admin_about.html")