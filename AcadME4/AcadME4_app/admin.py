from django.contrib import admin

# Register your models here.
from django.contrib import admin

# Register your models here.
from django.contrib.auth.admin import UserAdmin

from AcadME4_app.models import CustomUser


class UserModel(UserAdmin):
    pass

admin.site.register(CustomUser,UserModel)

from django.contrib import admin
from AcadME4_app.models import FAQ

admin.site.register(FAQ)