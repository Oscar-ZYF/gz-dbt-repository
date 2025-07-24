SELECT
     o.orders_id,
     o.date_date,
     ROUND(
       o.margin 
       + CAST(s.shipping_fee AS FLOAT64) 
       - (CAST(s.logCost AS FLOAT64) + CAST(s.ship_cost AS FLOAT64))
     , 2) AS operational_margin,
     o.quantity,
     o.revenue,
     o.purchase_cost,
     o.margin,
     CAST(s.shipping_fee AS FLOAT64) AS shipping_fee,
     CAST(s.logCost AS FLOAT64) AS logCost,
     CAST(s.ship_cost AS FLOAT64) AS ship_cost
FROM {{ ref("int_orders_margin") }} o
LEFT JOIN {{ ref("stg_raw__ship") }} s
     USING(orders_id)
ORDER BY orders_id DESC


