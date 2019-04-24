from django.urls import path

from . import views

urlpatterns = [
    path('', views.index, name='index'),
    path('home', views.home, name='home'),
    path('manager', views.manager, name='manager'),
    path('passenger', views.passenger, name='passenger'),
    path('about', views.about, name='about'),
    path('like', views.like, name='like'),

]