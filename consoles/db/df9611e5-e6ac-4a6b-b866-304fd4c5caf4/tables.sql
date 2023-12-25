use communal_services;

CREATE TABLE `Consumer` (
  `consumer_id` integer PRIMARY KEY auto_increment,
  `subsidies_id` integer unique,
  `first_name` varchar(256) NOT NULL,
  `middle_name` varchar(256) NOT NULL,
  `last_name` varchar(256) NOT NULL,
  `address` varchar(256),
  `phone_number` double NOT NULL,
  `bill` integer,
  `email` varchar(256),
  `IBAN` varchar(255)
);

CREATE TABLE `Receipt` (
  `receipt_id` integer PRIMARY KEY auto_increment,
  `consultant_id` integer,
  `consumer_id` integer,
  `object_id` integer unique,
  `creation_date` date,
  `payment_term` date,
  `total` float
);

CREATE TABLE `Services` (
  `services_id` integer PRIMARY KEY auto_increment,
  `utility_company_id` integer,
  `service_type_id` integer,
  `service_name` tinytext
);

CREATE TABLE `Service_type` (
  `service_type_id` integer PRIMARY KEY auto_increment,
  `service_type_name` varchar(50),
  `description` text
);

CREATE TABLE `Payment` (
  `payment_id` integer PRIMARY KEY auto_increment,
  `consultant_id` integer,
  `consumer_id` integer,
  `utility_id` integer,
  `consumption_volume` float,
  `sum` float
);

CREATE TABLE `Customer_services` (
  `customer_services_id` integer PRIMARY KEY auto_increment,
  `consumer_id` integer,
  `rates_id` integer unique,
  `service_type` tinytext
);

CREATE TABLE `Rates` (
  `rates_id` integer PRIMARY KEY auto_increment,
  `services_id` integer,
  `rate_amount` float,
  `service_type` tinytext,
  `rate_name` tinytext,
  `rate_category` tinytext
);

CREATE TABLE `Consultant` (
  `consultant_id` integer PRIMARY KEY auto_increment,
  `utility_company_id` integer,
  `services_id` integer,
  `first_name` tinytext,
  `last_name` tinytext
);

CREATE TABLE `Debt` (
  `debt_id` integer PRIMARY KEY auto_increment,
  `receipt_id` integer,
  `debt_amount` float,
  `date_the_debt_began` date
);

CREATE TABLE `Gas_meter` (
  `gas_meter_id` integer PRIMARY KEY auto_increment,
  `indicators` integer
);

CREATE TABLE `Object` (
  `object_id` integer PRIMARY KEY auto_increment,
  `gas_meter_id` integer unique,
  `object_type` varchar(50)
);

CREATE TABLE `Benefits` (
  `benefits_id` integer PRIMARY KEY auto_increment,
  `consumer_id` integer,
  `description` tinytext,
  `validity_period` date,
  `amount` float
);

CREATE TABLE `Subsidies` (
  `subsidies_id` integer PRIMARY KEY auto_increment,
  `category` tinytext,
  `amount` float
);

CREATE TABLE `Utility_company` (
  `utility_company_id` integer PRIMARY KEY auto_increment,
  `company_email` varchar(256),
  `IBAN` varchar(256),
  `name` varchar(256)
);

alter table receipt
add constraint check_creation_payment_date check (receipt.creation_date <= Receipt.payment_term);
