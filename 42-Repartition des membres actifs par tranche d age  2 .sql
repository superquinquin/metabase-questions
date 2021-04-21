/* 
 -------- Description --------




 -------- Filters translation -------- 


 -------- SQL -------- */

select
    case
        when age(to_date(birthdate, 'YYYY-MM-DD')) <= interval '23 years' then 'Etudiants (<23)'
        when age(to_date(birthdate, 'YYYY-MM-DD')) > interval '23 years' and age(to_date(birthdate, 'YYYY-MM-DD')) <= interval '30 years' then 'Jeunes actifs (23-30)'
        when age(to_date(birthdate, 'YYYY-MM-DD')) > interval '30 years' and age(to_date(birthdate, 'YYYY-MM-DD')) <= interval '55 years' then 'Parents (30-55)'
        when age(to_date(birthdate, 'YYYY-MM-DD')) > interval '55 years' then 'Retraités (>55)'
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