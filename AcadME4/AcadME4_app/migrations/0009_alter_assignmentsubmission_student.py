# Generated by Django 5.1 on 2025-03-30 19:15

import django.db.models.deletion
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('AcadME4_app', '0008_alter_studentresult_assignment1_marks_and_more'),
    ]

    operations = [
        migrations.AlterField(
            model_name='assignmentsubmission',
            name='student',
            field=models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, to='AcadME4_app.students'),
        ),
    ]
