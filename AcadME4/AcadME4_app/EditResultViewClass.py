from django.contrib import messages
from django.http import HttpResponseRedirect
from django.shortcuts import render, reverse
from django.views import View
from AcadME4_app.models import Students, Subjects, StudentResult, SessionYearModel


class EditResultViewClass(View):
    def get(self, request, *args, **kwargs):
        subjects = Subjects.objects.filter(staff_id=request.user.id)
        session_years = SessionYearModel.object.all()  # Fetch session years
        return render(request, "staff_template/edit_student_result.html", {"subjects": subjects,"session_years": session_years})

    def post(self, request, *args, **kwargs):
        subject_id = request.POST.get('subject')
        subject_obj = Subjects.objects.get(id=subject_id)

        try:
            for key, value in request.POST.items():
                if key.startswith('assignment1_'):
                    student_id = key.split('_')[1]
                    student_obj = Students.objects.get(admin=student_id)

                    assignment1_marks = request.POST.get(f'assignment1_{student_id}', None)
                    assignment2_marks = request.POST.get(f'assignment2_{student_id}', None)
                    periodical1_marks = request.POST.get(f'periodical1_{student_id}', None)
                    periodical2_marks = request.POST.get(f'periodical2_{student_id}', None)

                    # Convert values to float if provided, else keep them as None
                    assignment1_marks = float(assignment1_marks) if assignment1_marks else None
                    assignment2_marks = float(assignment2_marks) if assignment2_marks else None
                    periodical1_marks = float(periodical1_marks) if periodical1_marks else None
                    periodical2_marks = float(periodical2_marks) if periodical2_marks else None

                    # Check if the result already exists
                    result, created = StudentResult.objects.get_or_create(
                        student_id=student_obj,
                        subject_id=subject_obj
                    )

                    # Update only non-empty fields
                    if assignment1_marks is not None:
                        result.assignment1_marks = assignment1_marks
                    if assignment2_marks is not None:
                        result.assignment2_marks = assignment2_marks
                    if periodical1_marks is not None:
                        result.periodical1_marks = periodical1_marks
                    if periodical2_marks is not None:
                        result.periodical2_marks = periodical2_marks

                    result.save()

            messages.success(request, "Successfully Updated Results")
            return HttpResponseRedirect(reverse("edit_student_result"))
        except Exception as e:
            print(e)
            messages.error(request, "Failed to Update Results")
            return HttpResponseRedirect(reverse("edit_student_result"))
