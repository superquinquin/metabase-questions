/* 
 -------- Description --------




 -------- Filters translation -------- 


 -------- SQL -------- */

SELECT 
    sum("public"."report_pos_order"."price_total") AS "sum", 
    date_trunc('week', CAST("public"."report_pos_order"."date" AS timestamp)) AS "date"
FROM 
    "public"."report_pos_order"
WHERE 
    CAST("public"."report_pos_order"."date" AS timestamp)  >= date_trunc('month', current_date - interval '6' month)
    and CAST("public"."report_pos_order"."date" AS timestamp)  <= date_trunc('week', current_date+ interval '15' day )
GROUP BY 
    date_trunc('week', CAST("public"."report_pos_order"."date" AS timestamp))
ORDER BY 
    date_trunc('week', CAST("public"."report_pos_order"."date" AS timestamp)) ASC
