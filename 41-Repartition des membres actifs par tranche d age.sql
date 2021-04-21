/* 
 -------- Description --------




 -------- Filters translation -------- 


 -------- SQL -------- */

select
    case
        when age(to_date(birthdate, 'YYYY-MM-DD')) <= interval '23 years' then 'Etudiants (<23)'
        when age(to_date(birthdate, 'YYYY-MM-DD')) > interval '23 years' and age(to_date(birthdate, 'YYYY-MM-DD')) <= interval '35 years' then 'Jeunes actifs (23-35)'
        when age(to_date(birthdate, 'YYYY-MM-DD')) > interval '35 years' and age(to_date(birthdate, 'YYYY-MM-DD')) <= interval '45 years' then 'Jeunes parents (36-45)'
        when age(to_date(birthdate, 'YYYY-MM-DD')) > interval '45 years' and age(to_date(birthdate, 'YYYY-MM-DD')) <= interval '60 years' then 'Vieux parents (46-60)'
        when age(to_date(birthdate, 'YYYY-MM-DD')) > interval '60 years' then 'Retraités (>60)'
        else 'tranche inconnue'
    end as "Tranche",
    count(*) as "Nombre de membres"
from res_partner
where
    birthdate is not null
    and date_trunc('year', to_timestamp(birthdate, 'YYYY-MM-DD')) > to_timestamp('1920', 'YYYY')
    and date_trunc('year', to_timestamp(birthdate, 'YYYY-MM-DD')) < to_timestamp('2003', 'YYYY')
    and is_worker_member is true
    and is_unsubscribed is false
group by "Tranche"
order by "Nombre de membres" desc