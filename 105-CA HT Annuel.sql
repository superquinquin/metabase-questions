/* 
 -------- Description --------




 -------- Filters translation -------- 


 -------- SQL -------- */

SELECT sum("public"."report_pos_order"."price_total_vat_excl") AS "sum", date_trunc('year', CAST("public"."report_pos_order"."date" AS timestamp)) AS "date"
FROM "public"."report_pos_order"
WHERE "public"."report_pos_order"."date" >= '2018-01-01'
GROUP BY date_trunc('year', CAST("public"."report_pos_order"."date" AS timestamp))
ORDER BY date_trunc('year', CAST("public"."report_pos_order"."date" AS timestamp)) ASC