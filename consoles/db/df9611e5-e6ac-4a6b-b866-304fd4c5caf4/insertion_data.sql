use communal_services;

-- subsidies insertion
load data infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/subsidies_data.csv'
into table subsidies
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
ignore 2 lines
(category, amount);

-- consumer insertion
load data infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/consumer_data.csv'
into table consumer
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
ignore 2 lines
(subsidies_id, first_name, middle_name, last_name, address, phone_number, bill, email, IBAN);

-- benefits insertion
load data infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/benefits_data.csv'
into table benefits
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
ignore 2 lines
(consumer_id, description, validity_period, amount);

-- utility_company insertion
load data infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/utility_company_data.csv'
into table utility_company
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
ignore 2 lines
(company_email, IBAN, name);

-- service_type insertion
load data infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/service_type_data.csv'
into table service_type
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
ignore 2 lines
(service_type_name, description);

-- gas_meter insertion
load data infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/gas_meter_data.csv'
into table gas_meter
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
ignore 2 lines
(indicators);

-- object insertion
load data infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/object_data.csv'
into table object
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
ignore 2 lines
(gas_meter_id, object_type);

-- services insertion
load data infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/services_data.csv'
into table services
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
ignore 2 lines
(service_type_id, service_name, utility_company_id);

-- consultant insertion
load data infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/consultant_data.csv'
into table consultant
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
ignore 2 lines
(utility_company_id, services_id, first_name, last_name);

-- receipt insertion
load data infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/receipt_data.csv'
into table receipt
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
ignore 2 lines
(object_id, creation_date, payment_term, total, consumer_id, consultant_id);

-- debt insertion
load data infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/debt_data.csv'
into table debt
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
ignore 2 lines
(receipt_id, debt_amount, date_the_debt_began);

-- rates insertion
load data infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/rates_data.csv'
into table rates
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
ignore 2 lines
(services_id, rate_amount, service_type, rate_name, rate_category);

-- customer_services insertion
load data infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/customer_services_data.csv'
into table customer_services
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
ignore 2 lines
(consumer_id, rates_id, service_type);

-- payment insertion
load data infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/payment_data.csv'
into table payment
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
ignore 2 lines
(consultant_id, consumer_id, utility_id, consumption_volume, sum);


