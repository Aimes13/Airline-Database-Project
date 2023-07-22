CREATE TABLE "flights" (
  "flight_num" varchar(10) PRIMARY KEY,
  "airline_name" varchar(50),
  "departure_airport" varchar(50),
  "arrival_airport" varchar(50),
  "departure_date" date,
  "departure_time" time,
  "arrival_time" time,
  "travel_hours" integer
);

CREATE TABLE "passengers" (
  "passport_num" varchar(10) PRIMARY KEY,
  "name" varchar(50),
  "date_of_birth" date,
  "email" varchar(50),
  "telephone" varchar(15),
  "pax_type" varchar(10)
);

CREATE TABLE "pax_flight_log" (
  "pax_id" varchar(10),
  "flight_id" varchar(10),
  "route" varchar(10),
  PRIMARY KEY ("pax_id", "flight_id")
);

CREATE TABLE "pilots" (
  "id" varchar(10) PRIMARY KEY,
  "name" varchar(50),
  "flight_hours" integer
);

CREATE TABLE "pilot_flights_log" (
  "flight_id" varchar(10),
  "pilot_id" varchar(10),
  "route" varchar(10),
  PRIMARY KEY ("flight_id", "pilot_id")
);

CREATE TABLE "tickets" (
  "id" varchar(20) PRIMARY KEY,
  "pax_id" varchar(10),
  "flight_id" varchar(10),
  "type" varchar(5),
  "route" varchar
);

CREATE TABLE "meal_preference" (
  "code" varchar(5) PRIMARY KEY,
  "name" varchar(30),
  "description" varchar(300)
);

CREATE TABLE "pax_meal_log" (
  "pax_id" varchar(10),
  "meal_id" varchar(5),
  "confirmed" boolean,
  PRIMARY KEY ("pax_id", "meal_id")
);

ALTER TABLE "pilots" ADD FOREIGN KEY ("id") REFERENCES "pilot_flights_log" ("flight_id");

ALTER TABLE "flights" ADD FOREIGN KEY ("flight_num") REFERENCES "pilot_flights_log" ("pilot_id");

ALTER TABLE "flights" ADD FOREIGN KEY ("flight_num") REFERENCES "pax_flight_log" ("pax_id");

ALTER TABLE "passengers" ADD FOREIGN KEY ("passport_num") REFERENCES "pax_flight_log" ("flight_id");

ALTER TABLE "meal_preference" ADD FOREIGN KEY ("code") REFERENCES "pax_meal_log" ("pax_id");

ALTER TABLE "passengers" ADD FOREIGN KEY ("passport_num") REFERENCES "pax_meal_log" ("meal_id");

ALTER TABLE "passengers" ADD FOREIGN KEY ("passport_num") REFERENCES "tickets" ("id");

ALTER TABLE "tickets" ADD FOREIGN KEY ("id") REFERENCES "flights" ("flight_num");
