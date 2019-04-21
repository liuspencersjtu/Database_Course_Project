from django.shortcuts import render, HttpResponse
import json
import sqlite3

# Create your views here.
def index(request):
    if request.method == 'POST':
        username = request.POST.get('username')
        password = request.POST.get('password')
        print(username, password)
    return render(request, 'index.html', {'name':'Login Page'})

def home(request):
    if request.method == 'POST':
        username = request.POST.get('username')
        password = request.POST.get('password')
        print(username, password)
    return render(request, 'home.html')


def manager(request):
    if request.method == 'POST':
        username = request.POST.get('username')
        password = request.POST.get('password')
        print(username, password)
    return render(request, 'manager.html')


def passenger(request):
    if request.method == 'POST':
        #username = request.POST.get('username')
        #password = request.POST.get('password')
        #print(username, password)
        print('received')


        keyword = request.POST.get('keyword')
        print(keyword)
        conn = sqlite3.connect('db.sqlite3')
        cursor = conn.cursor()
        cursor.execute('select * from flight_info where destination = \'{}\''.format(keyword))
        values = cursor.fetchall()
        values = values[0]
        return HttpResponse(json.dumps({
                'result':1,
                'flight_no':values[0],
                'destination':values[1],
                'leaving_date':values[2],
                'boarding_time':values[3],
                'terminal':values[4],
                'number_of_passengers':values[5],
                'status':values[6]
            }))
    return render(request, 'passenger.html')

def about(request):
    if request.method == 'POST':
        username = request.POST.get('username')
        password = request.POST.get('password')
        print(username, password)
    return render(request, 'about.html')