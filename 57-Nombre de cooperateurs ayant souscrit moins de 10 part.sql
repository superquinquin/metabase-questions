/* 
 -------- Description --------




 -------- Filters translation -------- 


 -------- SQL -------- */

select count(total_partner_owned_share)
from res_partner
where
    active is true
    and is_worker_member is true
    and total_partner_owned_share <10