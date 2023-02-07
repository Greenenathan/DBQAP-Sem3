insert into cities (id,name,state,population) values (1,'New York', 'New York','8.468 million');
insert into cities (id,name,state,population) values (1,'Chicago', 'Illinois','2.6 million');
insert into cities (id,name,state,population) values (1,'Boston', 'Massachusetts','655,000');
insert into cities (id,name,state,population) values (1,'San Francisco', 'California','815,000');

insert into passengers (id,f_name,l_name,phone) values (1,'Nathan','Greene','(709)111-1111');
insert into passengers (id,f_name,l_name,phone) values (2,'Jordan','Kelloway','(709)111-1112');
insert into passengers (id,f_name,l_name,phone) values (3,'Cameron','D Amico','(709)111-1113');
insert into passengers (id,f_name,l_name,phone) values (4,'NotNathan','NotGreene','(709)111-1114');
insert into passengers (id,f_name,l_name,phone) values (5,'Tyler','Short','(709)111-1115');
insert into passengers (id,f_name,l_name,phone) values (6,'Ben','Del','(709)111-1116');
insert into passengers (id,f_name,l_name,phone) values (7,'John','Doe','(709)111-1117');
insert into passengers (id,f_name,l_name,phone) values (8,'Billy','Bob','(709)111-1118');

insert into airport (id,name,code) values (1,'airport1','A1');
insert into airport (id,name,code) values (2,'airport2','A2');
insert into airport (id,name,code) values (3,'airport3','A3');
insert into airport (id,name,code) values (4,'airport4','B1');
insert into airport (id,name,code) values (5,'airport5','B1');
insert into airport (id,name,code) values (6,'airport6','C1');
insert into airport (id,name,code) values (7,'airport7','D1');

insert into aircraft (id,type,airline,passengers) values (1,'plane','Westjet',1);
insert into aircraft (id,type,airline,passengers) values (1,'plane','Sunwing',2);
insert into aircraft (id,type,airline,passengers) values (1,'plane','IdkAnotherAirline',1);
insert into aircraft (id,type,airline,passengers) values (1,'plane','AirCanada',1);
insert into aircraft (id,type,airline,passengers) values (1,'plane','StillDunnoAirline',3);

select * from cities;
select * from passengers;
select * from airport;
select * from aircraft;

select c.name, a.name from airport a, cities c, city_airport ca
where ca.city_id = c.id
and ca.airport_id = a.id;

select p.f_name, p.l_name, b.airline from aircraft b, passengers p, pass_aircraft pb
where pb.pass_id = p.id
and pb.aircraft_id = b.id;

select b.airline, a.name from aircraft b, airport a, aircraft_airport ab
where ab.airport_id = a.id 
and ab.aircraft_id = b.id;

select p.f_name, p.l_name, a.name from passengers p, airport a, pass_airport pa
where pa.pass_id = p.id
and pa.airport_id = a.id;