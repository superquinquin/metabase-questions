/* 
 -------- Description --------




 -------- Filters translation -------- 


 -------- SQL -------- */

SELECT 
    sum("public"."report_pos_order"."price_total") AS "sum", 
    date_trunc('day', CAST("public"."report_pos_order"."date" AS timestamp)) AS "date"
FROM 
    "public"."report_pos_order"
WHERE 
    CAST("public"."report_pos_order"."date" AS timestamp)  >= date_trunc('month', current_date - interval '3' month ) and 
        date_part('dow',CAST("public"."report_pos_order"."date" AS timestamp) ) =6 
GROUP BY 
    date_trunc('day', CAST("public"."report_pos_order"."date" AS timestamp))
having 
    sum("public"."report_pos_order"."price_total") > 250 
ORDER BY 
    date_trunc('day', CAST("public"."report_pos_order"."date" AS timestamp)) ASC
