-- Create Tables --
CREATE TABLE passengers (
    passport_num varchar(10) PRIMARY KEY,
    name varchar(50), 
    date_of_birth date,
    email varchar(50),
    telephone varchar(15),
    pax_type varchar(10)
);

CREATE TABLE flights (
    flight_num varchar(10) PRIMARY KEY,
    airline_name varchar(50), 
    departure_airport varchar(50),
    arrival_airport varchar(50),
    departure_date date,
    departure_time time,
    arrival_time time,
    travel_hours numeric(3,1)
);

CREATE TABLE pax_flight_log (
    pax_id varchar(10) REFERENCES passengers(passport_num),
    flight_id varchar(10) REFERENCES flights(flight_num),
    PRIMARY KEY (pax_id, flight_id),
    route varchar(10)
);

CREATE TABLE pilots (
    id varchar(10) PRIMARY KEY,
    name varchar(50),
    flight_hours integer
);

CREATE TABLE pilot_flight_log (
    flight_id varchar(10) REFERENCES flights(flight_num),
    pilot_id varchar(10) REFERENCES pilots(id),
    PRIMARY KEY (flight_id, pilot_id),
    route varchar(10)
);

CREATE TABLE tickets (
    id varchar(20) PRIMARY KEY, 
    pax_id varchar(10) REFERENCES passengers(passport_num),
    flight_id varchar(10) REFERENCES flights(flight_num),
    type varchar(5), 
    route varchar(10)
);

CREATE TABLE meal_preference (
    code varchar(5) PRIMARY KEY,
    name varchar(30),
    description varchar(300)
);

CREATE TABLE pax_meal_log (
    pax_id varchar(10) REFERENCES passengers(passport_num),
    meal_id varchar(5) REFERENCES meal_preference(code),
    PRIMARY KEY (pax_id, meal_id),
    confirmed boolean
);

-- Populate Tables --
-- https://www.flightstats.com/v2/flight-tracker/search --
INSERT INTO flights (flight_num, airline_name, departure_airport, arrival_airport, departure_date, departure_time, arrival_time, travel_hours)
VALUES 
    ('5X 778', 'UPS Airlines', 'RFD', 'IAH', '2023-07-21', '03:14', '05:19', 2.1),
    ('TO 7644', 'Transavia', 'ORY', 'LIS', '2023-07-21', '11:10', '12:50', 2.7),
    ('W6 4325', 'Wizz Air', 'SOF', 'EIN', '2023-07-21', '12:05', '14:00', 2.1),
    ('AA 100', 'American Airlines', 'JFK', 'LHR', '2023-07-21', '18:09', '06:20', 12.3),
    ('AV 248', 'Avianca', 'GRU', 'BOG', '2023-07-21', '01:35', '05:45', 4.2);

-- https://worldgo.ca/understanding-your-airlines-meal-options/ --
INSERT INTO meal_preference (code, name, description)
VALUES 
    ('AVML', 'Asian Vegetarian Meal', 'A flavourful vegetarian alternative, with likely standards being curry dishes. Expect rice, noodles, fruit, vegetables and milk products but no meat, fish or eggs.'),
    ('BBML', 'Baby Meal', ''),
    ('BLML', 'Bland Meal', 'The meal is designed for passengers who may have ulcers, heartburn, nausea, vomiting, diarrhea or have undergone stomach or intestinal surgery. Includes foods that are soft, not very spicy, and low in fiber.'),
    ('CHML', 'Children Meal', 'Some adults, especially those with dentures or softer teeth, order children’s meals as usually contain soft and easier to chew foods. They often include an airline-branded toy or colouring book and crayons.'), 
    ('DBML', 'Diabetic Meal', 'Sugar reduced items only.'),
    ('FPML', 'Fruit Platter Meal', 'Seasonal fresh fruit.'), 
    ('GFML', 'Gluten Intolerant Meal', 'No wheat, rye, barley or other gluten-based products.'),
    ('HFML', 'High Fibre Meal', ''),
    ('HNML', 'Hindu Non-Vegetarian Meal', 'Traditionally flavoured meals that will likely contain lamb, poultry, fish or milk but absent of beef, veal or pork.'), 
    ('KSML', 'Kosher Meal', 'Confirmed to be prepared to meet strict Jewish Kosher cooking rules.'),
    ('LCML', 'Low Calorie Meal', ''),
    ('LFML', 'Low Fat Meal', ''),
    ('LPML', 'Low Protein Meal', 'Contains a restricted quantity of protein, specifically geared for those with liver and kidney ailments. These meals may contain fresh fruit and vegetables, vegetable fats and seasoning, and a measured amount of eggs and meat.'),
    ('LSML', 'Low Salt Meal', 'Intended for persons with high blood pressure or high-sodium intolerance.'),
    ('MOML', 'Muslim Meal', 'Foods that do not contain any pork, gelatine or alcoholic beverages.'),
    ('NLML', 'No Lactose/Lactose-Free Meal', 'It excludes milk and dairy products – yogurt, cheese, butter, ice cream, water ice and etc.'),
    ('ORML', 'Oriental Meal', 'The main course features an “Oriental style” accompanied by beef, pork, chicken, duck, or fish.'),
    ('PFML', 'Peanut-Free Meal', 'No peanuts, peanut butter, or other peanut derivative items.'),
    ('PRML', 'Low Purine Meal', 'For people struggling with gout.'),
    ('RVML', 'Raw Vegetable Meal', 'Only raw vegetables and salads.'),
    ('SFML', 'Seafood Meal', 'Contains only seafood items.'),
    ('SPML', 'Special Meal', 'Specify Food.'),
    ('VGML', 'Vegetarian Vegan Meal', 'No animal products, including meat, fish, dairy, eggs, honey.'),
    ('VJML', 'Vegetarian Jain Meal', 'Only fresh fruit and stem vegetables that grow above the ground. It won’t contain: animal products/by-products, honey or any root vegetables such as carrots and potatoes.'), 
    ('VLML', 'Vegetarian Lacto-Ovo Meal', 'Contains vegetables, fresh fruit, eggs, dairy products. It does not contain any type of fish or meat.'), 
    ('VOML', 'Vegetarian Oriental Meal', 'This is a vegetarian meal that is prepared ‘Chinese’ or ‘Oriental’ style.');

INSERT INTO passengers (passport_num, name, date_of_birth, email, telephone, pax_type)
VALUES 
    ('AN123456', 'Penelope Jane', '1983-07-26', 'pennyj@example.com', '22223333', 'ADULT'),
    ('GB97W433', 'Anderson Gibs', '1988-09-12', 'anderson@example.com', '12121212', 'ADULT'),
    ('FK333311', 'Chloe Gibs', '1994-05-30', 'chloe@live.com', '13272107', 'ADULT'),
    ('WT456786', 'Xander Gibs', '2013-01-31', 'chloe@live.com', '13272107', 'CHILD'),
    ('WT456999', 'Gibby Gibs', '2022-09-17', 'chloe@live.com', '13272107', 'INF'),
    ('QD887Y23', 'Anne-Marie Maks', '1991-05-30', 'mree77@liveexample.com', '1332868', 'ADULT');

INSERT INTO pax_flight_log (pax_id, flight_id)
VALUES 
    ('GB97W433', 'AA 100', 'JFK - LHR'),
    ('FK333311', 'AA 100', 'JFK - LHR'),
    ('WT456786', 'AA 100', 'JFK - LHR'),
    ('WT456999', 'AA 100', 'JFK - LHR'),
    ('AN123456', 'TO 7644', 'ORY - LIS'),
    ('QD887Y23', 'AV 248', 'GRU - BOG');

INSERT INTO pax_meal_log (pax_id, meal_id, confirmed)
VALUES 
    ('GB97W433', 'DBML', 'true'),
    ('FK333311', 'NLML', 'true'),
    ('WT456786', 'CHML', 'true'),
    ('WT456999', 'BBML', 'true'),
    ('AN123456', 'SFML', 'false'),
    ('QD887Y23', 'FPML', 'true');

INSERT INTO pilots (id, name, flight_hours)
VALUES 
    ('234523', 'Mackenzie Mueller', 2300),
    ('293864', 'Tawanda Gumede', 4950),
    ('995764', 'Zara Sampson', 3870),
    ('384063', 'Gary Thompson', 2820),
    ('384722', 'Miriam Mackeba', 4000);

INSERT INTO pilot_flight_log (flight_id, pilot_id, route)
VALUES 
    ('5X 778', '293864', 'RFD - IAH'),
    ('TO 7644', '384063', 'ORY - LIS'),
    ('W6 4325', '234523', 'SOF - EIN'),
    ('AA 100', '384722', 'JFK - LHR'),
    ('AV 248', '995764', 'GRU - BOG');

INSERT INTO tickets (id, pax_id, flight_id, type)
VALUES 
    ('001-2386296241', 'GB97W433', 'AA 100', 'RT', 'JFK - LHR'),
    ('001-2386296242', 'FK333311', 'AA 100', 'OW', 'JFK - LHR'),
    ('001-2386296243', 'WT456786', 'AA 100', 'OW', 'JFK - LHR'),
    ('001-2386296244', 'WT456999', 'AA 100', 'OW', 'JFK - LHR'),
    ('743-1826316230', 'AN123456', 'TO 7644', 'RT', 'ORY - LIS'),
    ('111-2386420534', 'QD887Y23', 'AV 248', 'RT', 'GRU - BOG');

-- QUERIES --
ALTER TABLE passengers 
ADD ticket_num varchar(20) REFERENCES tickets(id);

UPDATE passengers 
SET ticket_num = '001-2386296241' WHERE passport_num = 'GB97W433';

UPDATE passengers
SET ticket_num = '001-2386296242' WHERE passport_num = 'FK333311';

UPDATE passengers
SET ticket_num = '001-2386296243' WHERE passport_num = 'WT456786';

UPDATE passengers
SET ticket_num = '001-2386296244' WHERE passport_num = 'WT456999';

UPDATE passengers
SET ticket_num = '743-1826316230' WHERE passport_num = 'AN123456';

UPDATE passengers
SET ticket_num = '111-2386420534' WHERE passport_num = 'QD887Y23';


