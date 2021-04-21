/* 
 -------- Description --------




 -------- Filters translation -------- 


 -------- SQL -------- */

SELECT count(distinct "pos_order__via__order_id"."partner_id") AS "count", date_trunc('month', CAST("public"."pos_order_line"."create_date" AS timestamp)) AS "create_date"
FROM "public"."pos_order_line"
LEFT JOIN "public"."pos_order" "pos_order__via__order_id" ON "public"."pos_order_line"."order_id" = "pos_order__via__order_id"."id"
WHERE CAST("public"."pos_order_line"."create_date" AS date) >= CAST('2018-04-01T00:00:00.000Z'::timestamp AS date) 
GROUP BY date_trunc('month', CAST("public"."pos_order_line"."create_date" AS timestamp))
ORDER BY date_trunc('month', CAST("public"."pos_order_line"."create_date" AS timestamp)) ASC