/* 
 -------- Description --------




 -------- Filters translation -------- 


 -------- SQL -------- */

select
    res_partner.name as "Nom",
    st_reg.name as "Créneau",
    st_ti.name as "Créneau du ticket",
    str.date_open as "Date d'inscription",
    str.shift_template_id as "Template in reg",
    stt.shift_template_id as "Template in ticket",
    stt.name as "Type"
from
    res_partner
    inner join shift_template_registration str on res_partner.id = str.partner_id
    inner join shift_template st_reg on str.shift_template_id = st_reg.id
    inner join shift_template_ticket stt on str.shift_ticket_id = stt.id
    inner join shift_template st_ti on stt.shift_template_id = st_ti.id
where
    str.shift_template_id != stt.shift_template_id
order by str.date_open desc