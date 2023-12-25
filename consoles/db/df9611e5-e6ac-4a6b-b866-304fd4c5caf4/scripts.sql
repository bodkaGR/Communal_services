use communal_services;

select
    first_name,
    count(first_name) as amount_names,
    sum(consumption_volume) as sum_consumption_volume,
    sum(sum) as sum_of_sum
from
    payment
join
    consumer on payment.consumer_id = consumer.consumer_id
where
    first_name like 'Sa%'
group by
    first_name;