/* 
 -------- Description --------




 -------- Filters translation -------- 


 -------- SQL -------- */

select
    res_partner.display_name as "Nom",
    res_partner.shift_type as "Type",
    res_partner.cooperative_state as "Status",
    res_partner.final_ftop_point as "Compteur vacation",
    res_partner.final_standard_point as "Compteur fixe",
    "last_purchase"."order_date" as "Date dernier achat",
    cast(res_partner.unsubscription_date as timestamp) as "Date desinscription",
    coalesce(res_partner.mobile, res_partner.phone) as "Telephone",
    res_partner.email as "Email"
from
    res_partner
    left join (
        select
            distinct on (pos_order.partner_id) pos_order.partner_id as "partner_id",
            pos_order.create_date as "order_date"
        from
            pos_order
        order by pos_order.partner_id, pos_order.create_date desc) as "last_purchase" on "last_purchase"."partner_id" = res_partner.id
where
    res_partner.active is True
    and res_partner.is_member is True