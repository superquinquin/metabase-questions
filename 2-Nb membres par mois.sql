/* 
 -------- Description --------




 -------- Filters translation -------- 


 -------- SQL -------- */

SELECT count(*) AS "count", date_trunc('month', CAST("public"."res_partner"."create_date" AS timestamp)) AS "create_date"
FROM "public"."res_partner"
WHERE CAST("public"."res_partner"."create_date" AS date) >= CAST('2017-11-01T00:00:00.000Z'::timestamp AS date) 
GROUP BY date_trunc('month', CAST("public"."res_partner"."create_date" AS timestamp))
ORDER BY date_trunc('month', CAST("public"."res_partner"."create_date" AS timestamp)) ASC



