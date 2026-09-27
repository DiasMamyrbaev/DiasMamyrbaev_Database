create table stations (
    station_id serial primary key,
    station_name varchar(67) not null,
    country varchar(67) not null,
    state varchar(67),
    city varchar(67) not null,
    created_at timestamp default current_timestamp,
    updated_at timestamp default current_timestamp
);


create table railway_companies (
    company_id serial primary key,
    company_code varchar(67) unique not null,
    company_name varchar(67) not null,
    country varchar(67) not null,
    created_at timestamp default current_timestamp,
    updated_at timestamp default current_timestamp
);


create table passengers (
    passenger_id serial primary key,
    first_name varchar(67) not null,
    last_name varchar(67) not null,
    gender varchar(67),
    date_of_birth date not null,
    country_of_citizenship varchar(67) not null,
    country_of_residence varchar(67) not null,
    passport_number varchar(67) unique not null,
    created_at timestamp default current_timestamp,
    updated_at timestamp default current_timestamp
);


create table trips (
    trip_id serial primary key,
    company_id integer references railway_companies(company_id) on delete cascade,
    departure_station_id integer references stations(station_id),
    arrival_station_id integer references stations(station_id),
    departure_platform varchar(67),
    arrival_platform varchar(67),
    scheduled_departure_time timestamp not null,
    scheduled_arrival_time timestamp not null,
    actual_departure_time timestamp,
    actual_arrival_time timestamp,
    created_at timestamp default current_timestamp,
    updated_at timestamp default current_timestamp
);


create table tickets (
    ticket_id serial primary key,
    trip_id integer references trips(trip_id) on delete cascade,
    passenger_id integer references passengers(passenger_id) on delete cascade,
    ticket_price numeric(10, 2) not null,
    ticket_status varchar(67) not null,
    booking_platform varchar(67),
    created_at timestamp default current_timestamp,
    updated_at timestamp default current_timestamp
);


create table ticket_audit_logs (
    log_id serial primary key,
    ticket_id integer references tickets(ticket_id) on delete cascade,
    previous_status varchar(67),
    new_status varchar(67),
    changed_at timestamp default current_timestamp,
    change_description text
);


create table boarding_passes (
    boarding_pass_id serial primary key,
    ticket_id integer unique references tickets(ticket_id) on delete cascade,
    seat_number varchar(67) not null,
    boarding_time timestamp not null,
    created_at timestamp default current_timestamp,
    updated_at timestamp default current_timestamp
);


create table luggage (
    luggage_id serial primary key,
    ticket_id integer references tickets(ticket_id) on delete cascade,
    weight_kg numeric(5, 2) not null,
    created_at timestamp default current_timestamp,
    updated_at timestamp default current_timestamp
);


create table luggage_inspections (
    inspection_id serial primary key,
    luggage_id integer references luggage(luggage_id) on delete cascade,
    ticket_id integer references tickets(ticket_id) on delete cascade,
    passenger_id integer references passengers(passenger_id) on delete cascade,
    inspection_result varchar(67) not null,
    created_at timestamp default current_timestamp,
    updated_at timestamp default current_timestamp
);


create table security_checks (
    security_check_id serial primary key,
    passenger_id integer references passengers(passenger_id) on delete cascade,
    check_result varchar(67) not null,
    created_at timestamp default current_timestamp,
    updated_at timestamp default current_timestamp
);

