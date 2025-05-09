"""
URL configuration for AcadME4 project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/5.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.conf.urls.static import static


from django.conf import settings
from django.contrib import admin
from django.urls import path
from AcadME4_app import views,AdminViews
from django.conf import settings

from AcadME4_app import StudentViews

from AcadME4_app import StaffViews

from AcadME4_app.EditResultViewClass import EditResultViewClass




urlpatterns = [
    path('demo', views.showDemoPage),
    path('admin/', admin.site.urls),
    path('',views.ShowLoginPage,name="show_login"),
    path('get_user_details',views.GetUserDetails),
    path('logout_user',views.logout_user,name="logout"),
    path('doLogin',views.doLogin,name="do_login"),
    path('admin_home',AdminViews.admin_home,name="admin_home"),
    path('add_staff',AdminViews.add_staff,name='add_staff'),
    path('add_staff_save',AdminViews.add_staff_save,name='add_staff_save'),
    path('add_course',AdminViews.add_course,name='add_course'),
    path('add_course_save',AdminViews.add_course_save,name='add_course_save'),
    path('add_student',AdminViews.add_student,name='add_student'),
    path('add_student_save',AdminViews.add_student_save,name='add_student_save'),
    path('add_branch',AdminViews.add_branch,name='add_branch'),
    path('add_branch_save',AdminViews.add_branch_save,name='add_branch_save'),
path('manage-branch/', AdminViews.manage_branch, name='manage_branch'),
path('edit-branch/<int:branch_id>/', AdminViews.edit_branch, name='edit_branch'),
path('delete-branch/<int:branch_id>/', AdminViews.delete_branch, name='delete_branch'),

    path("get-branches-by-course/", AdminViews.get_branches_by_course, name="get_branches_by_course"),
path("get-branch/<int:course_id>/", AdminViews.get_branch, name="get_branch"),
   # path("get_branches_by_course/", AdminViews.get_branches_by_course, name="get_branches_by_course"),
    path("get-subjects-by-course-and-branch/", AdminViews.get_subjects_by_course_and_branch, name="get_subjects_by_course_and_branch"),
    path('get_attendance_data/',StudentViews.get_attendance_data, name="get_attendance_data"),
    path('add_subject',AdminViews.add_subject,name='add_subject'),
    path('add_subject_save',AdminViews.add_subject_save,name='add_subject_save'),
    path('manage_staff',AdminViews.manage_staff,name='manage_staff'),
    path('manage_student',AdminViews.manage_student,name='manage_student'),
    path('staff/subjects/', StaffViews.staff_subjects, name='staff_subjects'),
    path('manage_course',AdminViews.manage_course,name='manage_course'),
    path('manage_subject',AdminViews.manage_subject,name='manage_subject'),
    path('edit_staff/<str:staff_id>',AdminViews.edit_staff,name='edit_staff'),
    path('edit_staff_save',AdminViews.edit_staff_save,name='edit_staff_save'),
    path('edit_student/<str:student_id>',AdminViews.edit_student,name='edit_student'),
    path('edit_student_save',AdminViews.edit_student_save,name='edit_student_save'),
    path('edit_subject/<str:subject_id>',AdminViews.edit_subject,name='edit_subject'),
    path('edit_subject_save',AdminViews.edit_subject_save,name='edit_subject_save'),
    path('edit_course/<str:course_id>',AdminViews.edit_course,name='edit_course'),
    path('edit_course_save',AdminViews.edit_course_save,name='edit_course_save'),
    path('manage_session', AdminViews.manage_session, name='manage_session'),
    path('add_session_save', AdminViews.add_session_save, name='add_session_save'),
    path('check_email_exist', AdminViews.check_email_exist, name='check_email_exist'),
    path('check_username_exist', AdminViews.check_username_exist, name='check_username_exist'),
    path('student_feedback_message', AdminViews.student_feedback_message, name='student_feedback_message'),
    path('student_feedback_message_replied', AdminViews.student_feedback_message_replied, name='student_feedback_message_replied'),
    path('staff_feedback_message', AdminViews.staff_feedback_message, name='staff_feedback_message'),
    path('staff_feedback_message_replied', AdminViews.staff_feedback_message_replied, name='staff_feedback_message_replied'),
    path('admin_profile', AdminViews.admin_profile, name='admin_profile'),
    path('admin_profile_save', AdminViews.admin_profile_save, name='admin_profile_save'),
    path('admin_view_attendance', AdminViews.admin_view_attendance, name='admin_view_attendance'),
    path('admin_get_attendance_dates', AdminViews.admin_get_attendance_dates, name='admin_get_attendance_dates'),
    path('admin_get_attendance_student', AdminViews.admin_get_attendance_student, name='admin_get_attendance_student'),
   path('admin_get_monthly_attendance', AdminViews.admin_get_monthly_attendance, name='admin_get_monthly_attendance'),
    # Staff URl Path
    path('staff_home', StaffViews.staff_home, name='staff_home'),
    path('student_home', StudentViews.student_home, name='student_home'),
    path('student_view_attendance/', StudentViews.student_view_attendance, name='student_view_attendance'),

    path('staff_take_attendance', StaffViews.staff_take_attendance, name='staff_take_attendance'),
    path('staff_update_attendance', StaffViews.staff_update_attendance, name='staff_update_attendance'),
    path('get_students', StaffViews.get_students, name='get_students'),
    path('get_attendance_dates', StaffViews.get_attendance_dates, name='get_attendance_dates'),
    path('get_attendance_student', StaffViews.get_attendance_student, name='get_attendance_student'),
    path('save_attendance_data', StaffViews.save_attendance_data, name='save_attendance_data'),
    path('save_updateattendance_data', StaffViews.save_updateattendance_data, name='save_updateattendance_data'),
    path('staff_feedback', StaffViews.staff_feedback, name='staff_feedback'),
    path('staff_feedback_save', StaffViews.staff_feedback_save, name='staff_feedback_save'),
    path('staff_upload_assignment',StaffViews.staff_upload_assignment, name="staff_upload_assignment"),

    path('student_feedback', StudentViews.student_feedback, name='student_feedback'),
    path('student_feedback_save', StudentViews.student_feedback_save, name='student_feedback_save'),
    path('staff_profile', StaffViews.staff_profile, name='staff_profile'),
    path('staff_profile_save', StaffViews.staff_profile_save, name='staff_profile_save'),
    path('staff_add_result', StaffViews.staff_add_result, name='staff_add_result'),
    path('save_student_result', StaffViews.save_student_result, name='save_student_result'),
    path('edit_student_result', EditResultViewClass.as_view(), name='edit_student_result'),
    path('fetch_result_student', StaffViews.fetch_result_student, name='fetch_result_student'),

    path('student_profile', StudentViews.student_profile, name='student_profile'),
    path('student_profile_save', StudentViews.student_profile_save, name='student_profile_save'),

    path('student_notifications', StudentViews.student_notifications, name='student_notifications'),
    path('staff_notifications', StaffViews.staff_notifications, name='staff_notifications'),
    path('send_notification', AdminViews.send_notification,name='send_notification'),
    path('student_view_result', StudentViews.student_view_result, name='student_view_result'),
    path("student_view_assignments", StudentViews.student_view_assignments, name="student_view_assignments"),
 path("student_submit_assignment/<int:assignment_id>",StudentViews.student_submit_assignment,
                    name="student_submit_assignment"),

 # Staff URLs
 path("staff_view_submissions", StaffViews.staff_view_submissions, name="staff_view_submissions"),
# path("staff_grade_submission/<int:submission_id>", StaffViews.staff_grade_submission,name="staff_grade_submission"),

path('admin_timetable/', AdminViews.admin_timetable, name='admin_timetable'),
path("get_timetable_data/", AdminViews.get_timetable_data, name="get_timetable_data"),
path("add_timetable_entry/", AdminViews.add_timetable_entry, name="add_timetable_entry"),



path('staff_view_timetable', StaffViews.staff_view_timetable, name="staff_view_timetable"),
path('student_timetable_view', StudentViews.student_timetable_view, name="student_timetable_view"),

path('college-gallery/', StudentViews.college_gallery, name='college_gallery'),
path('staff-gallery/', StaffViews.staff_gallery, name='staff_gallery'),
path('admin-gallery/', AdminViews.admin_gallery, name='admin_gallery'),
path("upload_syllabus_books/", StaffViews.upload_syllabus_books, name="upload_syllabus_books"),

path('view_syllabus_books', StudentViews.view_syllabus_books, name="view_syllabus_books"),

path('college/about/', StudentViews.student_about, name='student_about'),
path('staff/about/', StaffViews.staff_about, name='staff_about'),
path('custom_admin/about/', AdminViews.admin_about, name='admin_about'),

path("get-branches/<int:course_id>/", StaffViews.get_branches, name="get_branches"),
path("get-subjects/<int:branch_id>/", StaffViews.get_subjects, name="get_subjects"),
path("get-teacher-courses/", StaffViews.get_teacher_courses, name="get_teacher_courses"),
path("student_subjects", StudentViews.student_subjects, name="student_subjects"),
                  path('get-submissions/<int:subject_id>/', StaffViews.get_filtered_submissions, name='get_submissions'),
path('get_subjects_by_course_and_branch/',  AdminViews.get_subjects_by_course_and_branch,name='get_subjects_by_course_and_branch'),
path('get_teachers_by_subject/',  AdminViews.get_teachers_by_subject, name='get_teachers_by_subject'),
                  path('get-session-years/', StaffViews.get_session_years, name='get_session_years'),
path('delete-student/<int:student_id>/', AdminViews.delete_student, name='delete_student'),
path('delete-staff/<int:staff_id>/', AdminViews.delete_staff, name='delete_staff'),
path('delete-subject/<int:subject_id>/', AdminViews.delete_subject, name='delete_subject'),
path('staff/chatbot/', StaffViews.staff_chatbot, name='staff_chatbot'),
path('student/chatbot/', StudentViews.student_chatbot, name='student_chatbot'),
path('admin-chatbot/', AdminViews.admin_chatbot, name='admin_chatbot'),
path('delete-course/<int:course_id>/', AdminViews.delete_course, name='delete_course'),




]+static(settings.MEDIA_URL,document_root=settings.MEDIA_ROOT)+static(settings.STATIC_URL,document_root=settings.STATIC_ROOT)


if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)