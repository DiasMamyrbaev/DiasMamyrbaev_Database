/* Генерация и вставка тестовых данных */
INSERT INTO Airport (airport_id, airport_name, country, state, city, created_at, updated_at)
SELECT 
    i, 
    'Airport_' || i, 
    'Country_' || i, 
    'State_' || i, 
    'City_' || i, 
    NOW(), 
    NOW()
FROM generate_series(1, 200) AS i;

/* Добавление авиакомпании "KazAir" */
INSERT INTO Airline (airline_id, airline_code, airline_name, airline_country, created_at, updated_at)
VALUES (1001, 'KZ', 'KazAir', 'Kazakhstan', NOW(), NOW());

/* Обновление страны KazAir на Turkey */
UPDATE Airline 
SET airline_country = 'Turkey', updated_at = NOW()
WHERE airline_name = 'KazAir';

/* Добавление трех авиакомпаний одновременно */
INSERT INTO Airline (airline_id, airline_code, airline_name, airline_country, created_at, updated_at) VALUES
(1002, 'AE', 'AirEasy', 'France', NOW(), NOW()),
(1003, 'FH', 'FlyHigh', 'Brazil', NOW(), NOW()),
(1004, 'FF', 'FlyFly', 'Poland', NOW(), NOW());

/* Удаление всех рейсов с прилетом в 2024 году */
DELETE FROM Flights 
WHERE EXTRACT(YEAR FROM sch_arrival_time) = 2024;

/* Увеличение стоимости всех билетов в таблице booking на 15% */
UPDATE Booking 
SET ticket_price = ticket_price * 1.15, updated_at = NOW();

/* Удаление всех билетов со стоимостью менее 10000 */
DELETE FROM Booking 
WHERE ticket_price < 10000;


