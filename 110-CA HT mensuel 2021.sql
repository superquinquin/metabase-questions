/* 
 -------- Description --------




 -------- Filters translation -------- 


 -------- SQL -------- */

SELECT
    extract(month from "report_pos_order".date) as "month nb",
    to_char("report_pos_order".date, 'Mon') as "Mois",
    sum("report_pos_order".price_total_vat_excl) AS "Total HT"
FROM "report_pos_order"
WHERE
    "report_pos_order".date >= '2021-01-01'
    and "report_pos_order".date < '2022-01-01'
GROUP BY "month nb", "Mois"
order by "month nb"