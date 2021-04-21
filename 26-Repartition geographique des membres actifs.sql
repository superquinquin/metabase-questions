/* 
 -------- Description --------




 -------- Filters translation -------- 


 -------- SQL -------- */

select
    case
        when zip = '59800' then '59000'
        else zip
    end as "Code postal",
    count(zip) as "Nombre de membre"
from res_partner
where
    length(zip) = 5
    and is_member = true
    and is_unsubscribed = false
group by "Code postal"
order by "Nombre de membre" desc