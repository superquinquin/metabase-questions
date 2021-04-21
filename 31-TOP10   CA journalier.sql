/* 
 -------- Description --------




 -------- Filters translation -------- 


 -------- SQL -------- */

SELECT to_char(date_trunc('day', CAST("public"."report_pos_order"."date" AS timestamp)), 'Day DD Month YYYY') AS "date", sum("public"."report_pos_order"."price_total") AS "sum"
FROM "public"."report_pos_order"
GROUP BY date_trunc('day', CAST("public"."report_pos_order"."date" AS timestamp))
ORDER BY "sum" DESC
LIMIT 10