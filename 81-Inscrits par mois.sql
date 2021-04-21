/* 
 -------- Description --------




 -------- Filters translation -------- 


 -------- SQL -------- */

select
    "subs"."date",
    count("subs"."date")
from
    (select
        "ai".partner_id as "partner_id",
        min(date_trunc('month', CAST("ai".date_invoice AS timestamp))) as "date"
    from
        account_invoice as "ai"
    where
        "ai".is_capital_fundraising = true
        and "ai".state = 'paid'
        and CAST("ai".date_invoice AS timestamp)  >= date_trunc('month', current_date - interval '13' month)
        and CAST("ai".date_invoice AS timestamp)  <= date_trunc('month', current_date + interval '1' month)
    group by "ai".partner_id) as "subs"
group by "subs"."date"
order by "subs"."date" asc