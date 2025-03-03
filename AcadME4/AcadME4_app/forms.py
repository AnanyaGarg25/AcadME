
from django import forms
from AcadME4_app.models import Courses

from AcadME4_app.models import SessionYearModel

from AcadME4_app.models import Subjects,Branch
from django.forms import ChoiceField


class ChoiceNoValidation(ChoiceField):
    def validate(self, value):
        pass

class DateInput(forms.DateInput):
    input_type = "date"
from django import forms
from AcadME4_app.models import Courses, Branch, SessionYearModel

class AddStudentForm(forms.Form):
    email = forms.EmailField(label="Email", max_length=50,
                             widget=forms.EmailInput(attrs={"class": "form-control", "autocomplete": "off"}))
    password = forms.CharField(label="Password", max_length=50,
                               widget=forms.PasswordInput(attrs={"class": "form-control"}))
    btbt_id = forms.CharField(label="Banasthali ID", max_length=20,
                              widget=forms.TextInput(attrs={"class": "form-control"}))
    roll_no = forms.CharField(label="Roll No.", max_length=20,
                              widget=forms.TextInput(attrs={"class": "form-control"}))
    first_name = forms.CharField(label="First Name", max_length=50,
                                 widget=forms.TextInput(attrs={"class": "form-control"}))
    last_name = forms.CharField(label="Last Name", max_length=50,
                                widget=forms.TextInput(attrs={"class": "form-control"}))
    username = forms.CharField(label="Username", max_length=50,
                               widget=forms.TextInput(attrs={"class": "form-control", "autocomplete": "off"}))
    address = forms.CharField(label="Address", max_length=50,
                              widget=forms.TextInput(attrs={"class": "form-control"}))

    # ✅ Initialize empty fields
    course = forms.ChoiceField(label="Course", choices=[],
                               widget=forms.Select(attrs={"class": "form-control", "id": "course"}))
    branch = forms.ChoiceField(label="Branch", choices=[],
                               widget=forms.Select(attrs={"class": "form-control", "id": "branch"}), required=False)
    session_year_id = forms.ChoiceField(label="Session Year", choices=[],
                                        widget=forms.Select(attrs={"class": "form-control"}))

    profile_pic = forms.FileField(label="Profile Pic", required=False,
                                  widget=forms.FileInput(attrs={"class": "form-control"}))

    def __init__(self, *args, **kwargs):
        super(AddStudentForm, self).__init__(*args, **kwargs)

        # ✅ Populate course choices dynamically
        self.fields['course'].choices = [(course.id, course.course_name) for course in Courses.objects.all()]

        # ✅ Populate session year choices dynamically
        self.fields['session_year_id'].choices = [
            (ses.id, f"{ses.session_start_year} to {ses.session_end_year}")
            for ses in SessionYearModel.object.all()
        ]

        # ✅ Populate branch choices dynamically
        self.fields['branch'].choices = [(branch.id, branch.name) for branch in Branch.objects.all()]


class EditStudentForm(forms.Form):
    email=forms.EmailField(label="Email",max_length=50,widget=forms.EmailInput(attrs={"class":"form-control"}))
   # password=forms.CharField(label="Password",max_length=50,widget=forms.PasswordInput(attrs={"class":"form-control"}))
    btbt_id=forms.CharField(label="Banasthali ID", max_length=20,widget=forms.TextInput(attrs={"class": "form-control"}))
    first_name=forms.CharField(label="First Name",max_length=50,widget=forms.TextInput(attrs={"class":"form-control"}))
    last_name=forms.CharField(label="Last Name",max_length=50,widget=forms.TextInput(attrs={"class":"form-control"}))
    roll_no = forms.CharField(label="Roll No.", max_length=20, widget=forms.TextInput(attrs={"class": "form-control"}))
    username=forms.CharField(label="Username",max_length=50,widget=forms.TextInput(attrs={"class":"form-control"}))
    address=forms.CharField(label="Address",max_length=50,widget=forms.TextInput(attrs={"class":"form-control"}))


    course_list=[]
    try:
        courses = Courses.objects.all()
        for course in courses:
            small_course=(course.id,course.course_name)
            course_list.append(small_course)
    except:
        course_list = []



    session_list = []

    sessions = SessionYearModel.object.all()
    for ses in sessions:
        small_ses = (ses.id, str(ses.session_start_year)+ "  to  " + str(ses.session_end_year))
        session_list.append(small_ses)

        #session_list = []
    course=forms.ChoiceField(label="Course",choices=course_list,widget=forms.Select(attrs={"class":"form-control","id":"id_course"}))
    branch = forms.ChoiceField(label="Branch", choices=[],
                               widget=forms.Select(attrs={"class": "form-control","id":"id_branch"}))
    session_year_id=forms.ChoiceField(label="Session Year",widget=forms.Select(attrs={"class":"form-control"}),choices=session_list)
    profile_pic=forms.FileField(label="Profile Pic",max_length=50,widget=forms.FileInput(attrs={"class":"form-control"}),required=False)

    def __init__(self, *args, **kwargs):
        student_course_id = kwargs.pop("student_course_id", None)  # Get student’s current course
        super(EditStudentForm, self).__init__(*args, **kwargs)

        # 🛠️ Ensure branches are loaded correctly both when rendering & submitting
        if "course" in self.data:  # When form is submitted
            try:
                course_id = int(self.data.get("course"))  # Get selected course from form data
                self.fields["branch"].choices = [(branch.id, branch.name) for branch in
                                                 Branch.objects.filter(course_id=course_id)]
            except (ValueError, TypeError):
                self.fields["branch"].choices = []
        elif student_course_id:  # When form is first loaded
            self.fields["branch"].choices = [(branch.id, branch.name) for branch in
                                             Branch.objects.filter(course_id=student_course_id)]

class EditResultForm(forms.Form):
    def __init__(self,*args,**kwargs):
        self.staff_id=kwargs.pop("staff_id")
        super(EditResultForm,self).__init__(*args,**kwargs)
        subject_list=[]
        try:
            subjects=Subjects.objects.filter(staff_id=self.staff_id)
            for subject in subjects:
                subject_single=(subject.id,subject.subject_name)
                subject_list.append(subject_single)
        except:
            subject_list=[]

        self.fields['subject_id'].choices=subject_list

    session_list=[]
    try:
        sessions=SessionYearModel.object.all()
        for session in sessions:
            session_single=(session.id,str(session.session_start_year)+" TO "+ str(session.session_end_year))
            session_list.append(session_single)
    except:
        session_list=[]
    subject_id=forms.ChoiceField(label="Subject",widget=forms.Select(attrs={"class":"form-control"}))
    session_ids = forms.ChoiceField(label="Session Year", choices=session_list,widget=forms.Select(attrs={"class": "form-control"}))
    student_ids = ChoiceNoValidation(label="Student",widget=forms.Select(attrs={"class": "form-control"}))
    assignment_marks = forms.CharField(label="Assignment Marks", widget=forms.TextInput(attrs={"class": "form-control"}))
    exam_marks = forms.CharField(label="Exam Marks",widget=forms.TextInput(attrs={"class": "form-control"}))
from django import forms
from .models import Syllabus

class SyllabusUploadForm(forms.ModelForm):
    class Meta:
        model = Syllabus
        fields = ['title', 'subject', 'file']