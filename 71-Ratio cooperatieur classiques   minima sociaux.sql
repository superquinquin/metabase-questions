/* 
 -------- Description --------




 -------- Filters translation -------- 


 -------- SQL -------- */

select
    case
        when total_partner_owned_share <10 then 'minima sociaux'
        else 'classique'
    end as "Coopérateur",
    count(*)
from res_partner
where
    active is true
    and is_worker_member is true
group by "Coopérateur"