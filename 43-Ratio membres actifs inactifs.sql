/* 
 -------- Description --------




 -------- Filters translation -------- 


 -------- SQL -------- */

select
    case
        when is_unsubscribed is false then 'actif'
        else 'inactif'
    end as "Statut",
    count(*)
from res_partner
where
    active is true
    and is_worker_member is true
group by "Statut"