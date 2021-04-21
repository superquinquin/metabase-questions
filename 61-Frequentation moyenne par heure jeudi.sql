/* 
 -------- Description --------

Sur les 3 derniers mois


 -------- Filters translation -------- 


 -------- SQL -------- */

select
    extract(hour from count."Hour") as "Hour of day",
    avg(count."Frequentation")
from
    (select
        date_trunc('hour', date_order at time zone 'utc' at time zone 'europe/paris') as "Hour",
        count(id) as "Frequentation"
    from pos_order
    where age(date_order) < interval '3 months'
        and extract(hour from date_order at time zone 'utc' at time zone 'europe/paris') > 9
        and extract(hour from date_order at time zone 'utc' at time zone 'europe/paris') < 21
        and extract(isodow from date_order at time zone 'utc' at time zone 'europe/paris') = 4
    group by "Hour") as "count"
group by "Hour of day"
order by "Hour of day"