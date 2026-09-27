create table Airline_info(
    airline_id int,
    airline_code varchar(30),
    airline_name varchar(50),
    airline_country varchar(50),
    created_at timestamp,
    updated_at timestamp,
    info varchar(50)
);

create table Airport(
    airport_id int,
    airport_name varchar(50),
    country varchar(50),
    state varchar(50),
    city varchar(50),
    created_at timestamp,
    updated_at timestamp
);

create table Baggage_check(
    baggage_check_id int,
    check_result varchar(50),
    created_at timestamp,
    updated_at timestamp,
    booking_id int,
    passenger_id int
);

create table Baggage(
    baggage_id int,
    weight_in_kg decimal(4,2),
    created_at timestamp,
    updated_at timestamp,
    booking_id int
);

create table Boarding_pass(
    boarding_pass_id int,
    booking_id int,
    seat varchar(50),
    boarding_time timestamp,
    created_at timestamp,
    updated_at timestamp
);

create table Booking_flight(
    booking_flight_id int,
    booking_id int,
    flight_id int,
    created_at timestamp,
    updated_at timestamp
);

create table Booking(
    booking_id int,
    flight_id int,
    passenger_id int,
    booking_platform varchar(50),
    created_at timestamp,
    updated_at timestamp,
    status varchar(50),
    price decimal(7,2)
);

create table Flights(
    flight_id int,
    sch_departure_time timestamp,
    sch_arrival_time timestamp,
    departing_airport_id int,
    arriving_airport_id int,
    departing_gate varchar(50),
    arriving_gate varchar(50),
    airline_id int,
    act_departure_time timestamp,
    act_arrival_time timestamp,
    created_at timestamp,
    updated_at timestamp
);

create table Passengers(
    passenger_id int,
    first_name varchar(50),
    last_name varchar(50),
    date_of_birth date,
    gender varchar(50),
    country_of_citizenship varchar(50),
    country_of_residence varchar(50),
    passport_number varchar(20),
    created_at timestamp,
    updated_at timestamp
);

create table Security_check(
    security_check_id int,
    check_result varchar(20),
    created_at timestamp,
    updated_at timestamp,
    passenger_id int
);


/*
2. Define Primary Keys for each tables
 */
alter table Airline_info add constraint pk_airline_info primary key (airline_id);
alter table Airport add constraint pk_airport primary key (airport_id);
alter table Baggage_check add constraint pk_baggage_check primary key (baggage_check_id);
alter table Baggage add constraint pk_baggage primary key (baggage_id);
alter table Boarding_pass add constraint pk_boarding_pass primary key (boarding_pass_id);
alter table Booking add constraint pk_booking primary key (booking_id);
alter table Booking_flight add constraint pk_booking_flight primary key (booking_flight_id);
alter table Flights add constraint pk_flights primary key (flight_id);
alter table Passengers add constraint pk_passengers primary key (passenger_id);
alter table Security_check add constraint pk_security_check primary key (security_check_id);


/*
 4. Define for all attributes not null constraint;
 */
alter table Airline_info alter column airline_id set not null, alter column airline_code set not null, alter column airline_name set not null,
    alter column airline_country set not null, alter column created_at set not null, alter column updated_at set not null,
    alter column info set not null;

alter table Airport alter column airport_id set not null, alter column airport_name set not null, alter column country set not null,
    alter column state set not null, alter column city set not null, alter column created_at set not null, alter column updated_at set not null;

alter table Baggage_check alter column baggage_check_id set not null, alter column check_result set not null, alter column created_at set not null,
    alter column updated_at set not null, alter column booking_id set not null, alter column passenger_id set not null;

alter table Baggage alter column baggage_id set not null, alter column weight_in_kg set not null, alter column created_at set not null,
    alter column updated_at set not null, alter column booking_id set not null;

alter table Boarding_pass alter column boarding_pass_id set not null, alter column booking_id set not null, alter column seat set not null,
    alter column boarding_time set not null, alter column created_at set not null, alter column updated_at set not null;

alter table Booking_flight alter column booking_flight_id set not null, alter column booking_id set not null, alter column flight_id set not null,
    alter column created_at set not null, alter column updated_at set not null;

alter table Booking alter column booking_id set not null, alter column flight_id set not null, alter column passenger_id set not null,
    alter column booking_platform set not null, alter column created_at set not null, alter column updated_at set not null,
    alter column status set not null, alter column price set not null;

alter table Flights alter column flight_id set not null, alter column sch_departure_time set not null, alter column sch_arrival_time set not null,
    alter column departing_airport_id set not null, alter column arriving_airport_id set not null, alter column departing_gate set not null,
    alter column arriving_gate set not null, alter column airline_id set not null, alter column act_departure_time set not null,
    alter column act_arrival_time set not null, alter column created_at set not null, alter column updated_at set not null;

alter table Passengers alter column passenger_id set not null, alter column first_name set not null, alter column last_name set not null,
    alter column date_of_birth set not null, alter column gender set not null, alter column country_of_citizenship set not null,
    alter column country_of_residence set not null, alter column passport_number set not null, alter column created_at set not null,
    alter column updated_at set not null;

alter table Security_check alter column security_check_id set not null, alter column check_result set not null,
    alter column created_at set not null, alter column updated_at set not null, alter column passenger_id set not null;


/*
 5. Rename airline_info table to airline;
 */
alter table Airline_info rename to Airline;


/*
6. Rename column price to ticket_price in booking table;
 */
alter table Booking rename column price to ticket_price;


/*
 7. Change data type of departing_gate from varchar(50) to text;
 */
alter table Flights alter column departing_gate type text;


/*
 8. Drop the column info(varchar(50)) from the airline table.
 */
alter table Airline drop column info;


/*
9. Make a relationship between following tables:
 */
alter table Security_check add constraint fk_security_pass foreign key (passenger_id) references Passengers(passenger_id);
alter table Booking add constraint fk_booking_pass foreign key (passenger_id) references Passengers(passenger_id);
alter table Baggage_check add constraint fk_baggage_check_pass foreign key (passenger_id) references Passengers(passenger_id);

alter table Baggage_check add constraint fk_baggage_check_book foreign key (booking_id) references Booking(booking_id);
alter table Baggage add constraint fk_baggage_book foreign key (booking_id) references Booking(booking_id);
alter table Boarding_pass add constraint fk_boarding_pass_book foreign key (booking_id) references Booking(booking_id);
alter table Booking_flight add constraint fk_booking_flight_book foreign key (booking_id) references Booking(booking_id);

alter table Booking_flight add constraint fk_booking_flight_flight foreign key (flight_id) references Flights(flight_id);

alter table Flights add constraint fk_flight_dep_airport foreign key (departing_airport_id) references Airport(airport_id);
alter table Flights add constraint fk_flight_arr_airport foreign key (arriving_airport_id) references Airport(airport_id);

alter table Flights add constraint fk_flight_airline foreign key (airline_id) references Airline(airline_id);


