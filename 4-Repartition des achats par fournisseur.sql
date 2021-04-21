/* 
 -------- Description --------




 -------- Filters translation -------- 


 -------- SQL -------- */

SELECT sum("public"."purchase_order"."amount_total") AS "sum", "res_partner__via__partner_id"."name" AS "name"
FROM "public"."purchase_order"
LEFT JOIN "public"."res_partner" "res_partner__via__partner_id" ON "public"."purchase_order"."partner_id" = "res_partner__via__partner_id"."id"
GROUP BY "res_partner__via__partner_id"."name"
ORDER BY "sum" DESC, "res_partner__via__partner_id"."name" ASC