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
        flight_no = request.POST.get('flight_no')
        destination = request.POST.get('destination')
        leaving_date = request.POST.get('leaving_date')
        boarding_time = request.POST.get('boarding_time')
        terminal = request.POST.get('terminal')
        number_of_passengers = request.POST.get('number_of_passengers')
        status = request.POST.get('status')
        conn = sqlite3.connect('db.sqlite3')
        cursor = conn.cursor()
        print(type(flight_no), type(destination), type(leaving_date), type(boarding_time), type(terminal), type(number_of_passengers), type(status))
        cursor.execute('insert into flight_info (flight_no, destination, leaving_date, boarding_time, terminal, number_of_passengers, status) values(\'{}\', \'{}\', \'{}\', \'{}\', \'{}\', {}, \'{}\' )'.format(flight_no, destination, leaving_date, boarding_time, terminal, number_of_passengers, status))
        cursor.close()
        conn.commit()
        conn.close()
        print(flight_no)
        return HttpResponse(json.dumps({
                'result':1,
            }))
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
        print(values)
        res = []
        for item in values:
        	res.append({
        		'flight_no':item[0],
                'destination':item[1],
                'leaving_date':item[2],
                'boarding_time':item[3],
                'terminal':item[4],
                'number_of_passengers':item[5],
                'status':item[6]
        		})
        #values = values[0]
        cursor.close()
        conn.commit()
        conn.close()
        return HttpResponse(json.dumps({
                'result':1,
                'records':res
            }))
        '''
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
        '''
    return render(request, 'passenger.html')

def about(request):
    if request.method == 'POST':
        render(request, 'like.html')
    return render(request, 'about.html')

def like(request):
    if request.method == 'POST':
        render(request, 'like.html')
    return render(request, 'like.html')