create database airport_information;

create table passenger(
  cust_id int,
  name varchar(20),
  gender varchar(20),
  nationality varchar(20),
  seat varchar(4),
  dietary_restriction varchar(20),
  suitcase_number int,
  primary key(cust_id)
);

create table crew(
crew_id int,
pilot varchar(20),
first_officer varchar(20),
primary key(crew_id)
);

create table gate(
gate_id int,
gate_num int,
part varchar(1),
terminal_num int,
primary key(gate_id)
);

create table aeroplane(
plane_id int,
type varchar(20),
maximum_volume int,
primary key(plane_id)
);

create table dest_location(
airport_id varchar(3),
airport_name varchar(50),
state varchar(20),
country varchar(20),
city varchar(20),
primary key(airport_id)
);

create table flight_information(
flight_no int,
date varchar(20),
gate int,
status varchar(20),
boarding_time varchar(20),
departure_time varchar(20),
flight_duration int,
international varchar(3),
plane_type int,
airport_id varchar(3),

primary key(flight_no),

foreign key(plane_type) references aeroplane(plane_id),
foreign key(airport_id) references dest_location(airport_id),
foreign key(gate) references gate(gate_id)

);


create table flight_crew(
id int,
crew_id int,
flight_no int,
primary key(id),
foreign key(crew_id) references crew(crew_id),
foreign key(flight_no) references flight_information(flight_no)
);

create table passenger_flight(
id int,
cust_id int,
flight_no int,
primary key(id),
foreign key(cust_id) references passenger(cust_id) 
			ON DELETE CASCADE
            ON UPDATE CASCADE,
foreign key(flight_no) references flight_information(flight_no)
);

insert into aeroplane(plane_id, type, maximum_volume)
	values(2121001, "Airbus_A330-200", 247),
	(21002, "Airbus_A330-300", 291),
	(31001, "Boeing_767-300", 209),
	(31002, "Boeing_777-200", 250),
	(31003, "Boeing_777-300ER", 304),
	(31004, "Boeing_787-8", 226),
	(31005, "Boeing_787-9", 285),
	(31006, "Boeing_787-9", 285),
	(31007, "Boeing_787-9", 285),
	(31008, "Boeing_787-8",	219);

insert into crew(crew_id, pilot, first_officer)
	values(901, "Dullen", "Mike"),
	(902, "Gary", "Guo"),
	(903, "Adair", "Talen"),
	(904, "Aaron", "Mike"),
	(905, "Dullen", "Guo"),
	(906, "Gary", "Talen"),
	(907, "Adair", "Mike"),
	(908, "Aaron", "Guo"),
	(909, "Dullen", "Talen"),
	(910, "Gary", "Mike"),
    (911, "Adair", "Guo"),
	(912, "Aaron", "Talen"),
	(913, "Dullen", "Mike"),
	(914, "Gary", "Guo"),
	(915, "Adair", "Talen"),
	(916, "Aaron", "Mike"),
	(917, "Dullen", "Guo"),
	(918, "Gary", "Talen"),
	(919, "Adair", "Mike"),
	(920, "Adair", "Guo");
 
insert into dest_location(airport_id, airport_name, state, country, city)
	values("DEL", "Delhi_Airport", "India", "Delhi", "Delhi"),
	("HND", "Tokyo_Intl_Haneda", "Japan",	"Tokyo", "Tokyo"),
	("JFK", "New_York_JFK_Airport", "US", "New_York", "New_York_City"),
	("IAH", "Houston_Airport", "US", "Texas", "Houston"),
	("DFW", "Dallas/Fort_Worth", "US", "Texas", "Dallas"),
	("LAX", "Los_Angeles_Airport", "US", "California", "Los_Angeles"),
	("SFO", "San_Francisco", "US", "California", "San_Francisco"),
	("PEK", "Beijing_Capital_Airport", "China", "Beijing", "Beijing");

insert into flight_information(flight_no, date, gate, status, boarding_time, departure_time, flight_duration, international, plane_type, airport_id)
	values(1201, "2019-05-06", 1001, "Delay", "0730", "0800", 16, "Yes", 21002, "DEL"),
	(1202, "2019-05-06", 1003, "Arrival", "0740", "0810", 11, "Yes", 31001, "HND"),
	(1203, "2019-05-06", 1007, "Arrival", "0830", "0900", 3.5, "No", 31002, "JFK"),
	(1204, "2019-05-06", 1001, "Cancel", "0910", "0940", 5, "No", 31007, "IAH"),
	(1205, "2019-05-06", 1003, "Planned", "0915", "0945", 5, "No", 31003, "DFW"),
	(1206, "2019-05-06", 1007, "Planned", "1130", "1200", 5, "No", 2121001, "LAX"),
	(1207, "2019-05-06", 1002, "Planned", "1245", "1315", 5, "No", 31004, "SFO"),
	(1208, "2019-05-06", 1001, "Planned", "1630", "1700", 13, "Yes", 31006, "PEK"),
	(1209, "2019-05-07", 1004, "Planned", "1940", "2010", 5, "No", 31005, "IAH"),
	(1210, "2019-05-07", 1005, "Planned", "2300", "2330", 5, "No", 31008, "LAX");
    
insert into gate(gate_id, part, gate_num, terminal_num)
		values(1001, "A", 1, 1),
		(1002,	"A",	2,	1),
		(1003,	"A",	3,	1),
		(1004,	"B",	1,	1),
		(1005,	"B",	2,	1),
		(1006,	"B",	3,	1),
		(1007,	"C",	1,	2);

insert into passenger(cust_id, name, gender, nationality, seat, dietary_restriction, suitcase_number)
		values("11001",	"Dullen", "F",	"CN", "2B", "none" , 1),
		("11002", "Gary", "M", "US", "3C", "none", 2),
		("11003", "Adair", "F", "EU", "4D", "none", 1),
		(11004, "Kalvin", "M", "US", "5E", "vegetarian", 1),
		(11005, "Nelle", "F", "US", "6F", "none", 1),
		(11006, "Gilbert", "M", "EU", "7A", "none", 1),
		(11007, "Queen", "F", "US", "8B", "vegetarian", 2),
		(11008,	"Adamina", "F", "EN", "9C", "none", 2),
		(11009,	"Salmon", "M", "US", "10D", "none", 1),
		(11010,	"Dallas", "M", "FR", "11E", "none", 2);
        
insert into passenger_flight(id, cust_id, flight_no)
	values(1,	11001,	1201),
	(2, 11002,	1202),
	(3,	11003,	1203),
	(4,	11004,	1204),
	(5,	11005,	1205),
	(6,	11006,	1206),
	(7,	11007,	1207),
	(8,	11008,	1208),
	(9,	11009,	1209),
	(10, 11010,	1210);

select flight_no, airport_id
from flight_information left join aeroplane on flight_information.plane_type=aeroplane.plane_id
where aeroplane.type="Airbus_A330-300" ;

select flight_no, airport_id, part, gate_num
from flight_information left join gate on flight_information.gate=gate.gate_id
where part="B" ;

update passenger set cust_id=11111 where cust_id=11001;   

select nationality, count(cust_id)
from passenger
group by nationality;