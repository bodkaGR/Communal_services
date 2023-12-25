use communal_services;

-- admin role
create role administrator;
grant all privileges on communal_services.* to administrator;

create user 'admin'@'localhost' identified by 'pass';
grant administrator to 'admin'@'localhost';

set default role all to 'admin'@'localhost';

-- consultant role
create role consultant;
grant select on communal_services.* to consultant;
grant insert, update, delete on communal_services.consultant to consultant;

create user 'consultant'@'localhost' identified by 'pass';
grant consultant to 'consultant'@'localhost';

set default role all to 'consultant'@'localhost';

-- consumer role
create role consumer;
grant select, insert, update, delete on communal_services.consumer to consumer;
grant select, insert, update, delete on communal_services.customer_services to consumer;
grant select, insert, update, delete on communal_services.payment to consumer;

grant select on communal_services.benefits to consumer;
grant select on communal_services.consultant to consumer;
grant select on communal_services.debt to consumer;
grant select on communal_services.gas_meter to consumer;
grant select on communal_services.object to consumer;
grant select on communal_services.rates to consumer;
grant select on communal_services.receipt to consumer;
grant select on communal_services.subsidies to consumer;

grant update on communal_services.object to consumer;

create user 'consumer'@'localhost' identified by 'pass';
grant consumer to 'consumer'@'localhost';

set default role all to 'consumer'@'localhost';

