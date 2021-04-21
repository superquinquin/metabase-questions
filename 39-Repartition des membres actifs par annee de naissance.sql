/* 
 -------- Description --------




 -------- Filters translation -------- 


 -------- SQL -------- */

select
    to_char(to_timestamp(birthdate, 'YYYY-MM-DD'), 'YYYY') as "birthyear",
    count(*)
from res_partner
where
    birthdate is not null
    and date_trunc('year', to_timestamp(birthdate, 'YYYY-MM-DD')) > to_timestamp('1920', 'YYYY')
    and date_trunc('year', to_timestamp(birthdate, 'YYYY-MM-DD')) < to_timestamp('2003', 'YYYY')
    and is_worker_member is true
    and is_unsubscribed is false
group by "birthyear"
order by "birthyear"