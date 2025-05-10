from django.contrib.auth.models import AbstractUser
from django.db import models
from django.db.models.signals import post_save
from django.dispatch import receiver

# Create your models here.
from django.core.validators import MinValueValidator,MaxValueValidator
import os
from jsonschema.exceptions import ValidationError

class SessionYearModel(models.Model):
    id=models.AutoField(primary_key=True)
    session_start_year = models.DateField()
    session_end_year = models.DateField()
    object=models.Manager()

class CustomUser(AbstractUser):
    # Define user types
    user_type_data = ((1, "ADMIN"), (2, "Staff"), (3, "Student"))
    user_type = models.CharField(default=1, choices=user_type_data, max_length=10)

    # Add custom related_name to avoid conflicts
    groups = models.ManyToManyField(
        'auth.Group',
        related_name='customuser_groups',  # Custom related name for groups
        blank=True
    )
    user_permissions = models.ManyToManyField(
        'auth.Permission',
        related_name='customuser_permissions',  # Custom related name for user_permissions
        blank=True
    )


class Admin(models.Model):
    id=models.AutoField(primary_key=True)
    admin=models.OneToOneField(CustomUser,on_delete=models.CASCADE)
    created_at=models.DateTimeField(auto_now_add=True)
    updated_at=models.DateTimeField(auto_now_add=True)
    objects=models.Manager()

class Staffs(models.Model):
    GENDER_CHOICES = [
        ('Male', 'Male'),
        ('Female', 'Female'),
        ('Not Assigned', 'Not Assigned'),
    ]
    gender = models.CharField(
        max_length=15,
        choices=GENDER_CHOICES,
        default=' ',
    )
    id = models.AutoField(primary_key=True)
    admin = models.OneToOneField(CustomUser, on_delete=models.CASCADE)
    teacher_id = models.CharField(max_length=20, default="Not Assigned")
    address = models.TextField()
    profile_pic = models.FileField(null=True, blank=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now_add=True)
    objects=models.Manager()

class Courses(models.Model):
    id = models.AutoField(primary_key=True)
    course_name = models.CharField(max_length=255)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now_add=True)
    objects = models.Manager()

class Branch(models.Model):
    id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=255)
    course_id = models.ForeignKey(Courses, on_delete=models.CASCADE, default=1)
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.name

class Subjects(models.Model):
    id = models.AutoField(primary_key=True)
    subject_name = models.CharField(max_length=255)
    subject_code=models.CharField(max_length=50,unique=True,default="")
    course_id = models.ForeignKey(Courses,on_delete=models.CASCADE,default=1)
    branch_id = models.ForeignKey(Branch, on_delete=models.DO_NOTHING,default=1)
    staff_id=models.ForeignKey(CustomUser,on_delete=models.CASCADE)
    has_lab = models.BooleanField(default=False, null=False)  # ✅ Ensure default value
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now_add=True)
    objects = models.Manager()

class Labs(models.Model):
    id = models.AutoField(primary_key=True)
    lab_id = models.CharField(max_length=50, unique=True)  # Unique Lab ID
    lab_name = models.CharField(max_length=255)
    subject = models.ForeignKey(Subjects, on_delete=models.CASCADE)  # Links to Subject
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"{self.lab_name} (ID: {self.lab_id})"


class Students(models.Model):
    id = models.AutoField(primary_key=True)
    admin = models.OneToOneField(CustomUser, on_delete=models.CASCADE)
    roll_no = models.CharField(max_length=20,unique=True,default="Not Assigned")
    btbt_id= models.CharField(max_length=30,unique=True,default="Not Assigned")
    profile_pic=models.FileField(upload_to="", null=True, blank=True)
    address = models.TextField()
    course_id=models.ForeignKey(Courses,on_delete=models.DO_NOTHING)
    #branch_id=models.ForeignKey(Branch,on_delete=models.DO_NOTHING)
    session_year_id=models.ForeignKey(SessionYearModel,on_delete=models.CASCADE)
    branch_id = models.ForeignKey(Branch, on_delete=models.SET_NULL, null=True, blank=True)  # New field
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now_add=True)
    objects = models.Manager()

class Attendance(models.Model):
    CLASS_TYPE_CHOICES = [
        ("theory", "Theory"),
        ("lab", "Lab"),
    ]

    id = models.AutoField(primary_key=True)
    subject_id = models.ForeignKey(Subjects, on_delete=models.CASCADE)
    attendance_date=models.DateField()
    created_at = models.DateTimeField(auto_now_add=True)
    session_year_id = models.ForeignKey(SessionYearModel, on_delete=models.CASCADE)
    class_type = models.CharField(max_length=10, choices=CLASS_TYPE_CHOICES, default="theory")  # New Field
    updated_at = models.DateTimeField(auto_now_add=True)
    objects = models.Manager()

class AttendanceReport(models.Model):
    id = models.AutoField(primary_key=True)
    student_id=models.ForeignKey(Students,on_delete=models.CASCADE)
    attendance_id=models.ForeignKey(Attendance,on_delete=models.CASCADE)
    status=models.BooleanField(default=False)
    class_type = models.CharField(
        max_length=10,
        choices=[("theory", "Theory"), ("lab", "Lab")],
        default="theory"  # ✅ New field to store Theory/Lab selection
    )
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now_add=True)
    objects=models.Manager()

class FeedBackStudent(models.Model):
    id = models.AutoField(primary_key=True)
    student_id = models.ForeignKey(Students, on_delete=models.CASCADE)
    feedback = models.TextField()
    feedback_reply = models.TextField()
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now_add=True)
    objects = models.Manager()

class FeedBackStaffs(models.Model):
    id = models.AutoField(primary_key=True)
    staff_id = models.ForeignKey(Staffs, on_delete=models.CASCADE)
    feedback = models.TextField()
    feedback_reply=models.TextField()
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now_add=True)
    objects = models.Manager()


class NotificationStudent(models.Model):
    id = models.AutoField(primary_key=True)
    student_id = models.ForeignKey(Students, on_delete=models.CASCADE)
    message = models.TextField()
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now_add=True)
    objects = models.Manager()


class NotificationStaffs(models.Model):
    id = models.AutoField(primary_key=True)
    staff_id = models.ForeignKey(Staffs, on_delete=models.CASCADE)
    message = models.TextField()
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now_add=True)
    objects = models.Manager()

class StudentResult(models.Model):
    id = models.AutoField(primary_key=True)
    student_id = models.ForeignKey(Students, on_delete=models.CASCADE)
    subject_id = models.ForeignKey(Subjects, on_delete=models.CASCADE)
    assignment1_marks = models.FloatField(null=True, blank=True, default=None,validators=[MinValueValidator(0), MaxValueValidator(20)])
    assignment2_marks = models.FloatField(null=True, blank=True, default=None,validators=[MinValueValidator(0), MaxValueValidator(20)])
    periodical1_marks = models.FloatField(null=True, blank=True, default=None,validators=[MinValueValidator(0), MaxValueValidator(20)])
    periodical2_marks = models.FloatField(null=True, blank=True, default=None,validators=[MinValueValidator(0), MaxValueValidator(20)])
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now_add=True)
    objects = models.Manager()

@receiver(post_save,sender=CustomUser)
def create_user_profile(sender,instance,created,**kwargs):
    if created:
        if instance.user_type==1:
            Admin.objects.create(admin=instance)
        if instance.user_type==2:
            Staffs.objects.create(admin=instance,address="")
        if instance.user_type==3:
            Students.objects.create(admin=instance,course_id=Courses.objects.get(id=1),session_year_id=SessionYearModel.object.get(id=1),address="",profile_pic="")

@receiver(post_save,sender=CustomUser)
def save_user_profile(sender,instance,**kwargs):
    if instance.user_type==1:
        instance.admin.save()
    if instance.user_type==2:
        instance.staffs.save()
    if instance.user_type==3:
        instance.students.save()

def validate_pdf(value):
    ext = os.path.splitext(value.name)[1]  # Extract file extension
    if ext.lower() != '.pdf':
        raise ValidationError('Only PDF files are allowed.')

class Assignment(models.Model):
    id = models.AutoField(primary_key=True)
    title = models.CharField(max_length=255)
    description = models.TextField()
    subject = models.ForeignKey(Subjects, on_delete=models.CASCADE)
    staff = models.ForeignKey(Staffs, on_delete=models.CASCADE)  # The teacher who created the assignment
    due_date = models.DateField()
    assignment_file = models.FileField(upload_to="assignments/", validators=[validate_pdf], null=True, blank=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    objects = models.Manager()

    def __str__(self):
        return f"{self.title} - {self.subject.subject_name}"

class AssignmentSubmission(models.Model):
    id = models.AutoField(primary_key=True)
    assignment = models.ForeignKey(Assignment, on_delete=models.CASCADE)
    student = models.ForeignKey(Students, on_delete=models.CASCADE)
    submission_file = models.FileField(upload_to="submissions/", validators=[validate_pdf])
    submitted_at = models.DateTimeField(auto_now_add=True)
    status = models.CharField(
        max_length=20,
        choices=[("Submitted", "Submitted"), ("Graded", "Graded"), ("Late", "Late")],
        default="Submitted",
    )
    feedback = models.TextField(null=True, blank=True)
    marks_obtained = models.FloatField(default=0)

    objects = models.Manager()

    def __str__(self):
        return f"{self.student.admin.username} - {self.assignment.title}"
    '''
    def save(self, *args, **kwargs):
        # Check if submission is late
        if self.assignment.due_date and now() > self.assignment.due_date:
            self.status = "Late"
        super().save(*args, **kwargs)
    class Meta:
        verbose_name = "Assignment Submission"
        verbose_name_plural = "Assignment Submissions"'''

class Timetable(models.Model):
    DAYS_OF_WEEK = [
        ("Monday", "Monday"),
        ("Tuesday", "Tuesday"),
        ("Wednesday", "Wednesday"),
        ("Thursday", "Thursday"),
        ("Friday", "Friday"),
        ("Saturday", "Saturday"),
        ("Sunday", "Sunday"),
    ]

    id = models.AutoField(primary_key=True)
    subject = models.ForeignKey(Subjects, on_delete=models.CASCADE, null=True, blank=True)  # ✅ Allow null for labs
    course = models.ForeignKey(Courses, on_delete=models.CASCADE)
    teacher = models.ForeignKey(Staffs, on_delete=models.CASCADE)
    day_of_week = models.CharField(max_length=10, choices=DAYS_OF_WEEK)
    #lab = models.ForeignKey(Labs, on_delete=models.CASCADE, null=True, blank=True)  # ✅ New field for lab timetable
    start_time = models.TimeField()
    end_time = models.TimeField()

    def __str__(self):
        return f"{self.subject.subject_name} - {self.teacher.admin.first_name} {self.teacher.admin.last_name} ({self.day_of_week})"

    objects = models.Manager()


class Syllabus(models.Model):
    id = models.AutoField(primary_key=True)
    title = models.CharField(max_length=255)
    subject = models.ForeignKey(Subjects, on_delete=models.CASCADE)
    uploaded_by = models.ForeignKey(Staffs, on_delete=models.CASCADE)
    file = models.FileField(upload_to="syllabus/", validators=[validate_pdf])
    uploaded_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"{self.title} (Syllabus)"
class FAQ(models.Model):
    USER_TYPE_CHOICES = (
        ("admin", "Admin"),
        ("staff", "Staff"),
        ("student", "Student"),
    )
    question = models.CharField(max_length=255, unique=True)
    answer = models.TextField()
    user_type = models.CharField(max_length=20, choices=USER_TYPE_CHOICES, default="admin")

    def __str__(self):
        return self.question