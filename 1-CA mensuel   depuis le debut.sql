/* 
 -------- Description --------




 -------- Filters translation -------- 


 -------- SQL -------- */

SELECT sum("public"."report_pos_order"."price_total") AS "sum", date_trunc('month', CAST("public"."report_pos_order"."date" AS timestamp)) AS "date"
FROM "public"."report_pos_order"
GROUP BY date_trunc('month', CAST("public"."report_pos_order"."date" AS timestamp))
ORDER BY date_trunc('month', CAST("public"."report_pos_order"."date" AS timestamp)) ASC