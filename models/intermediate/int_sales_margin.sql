
WITH joined AS (
    SELECT
        s.date_date,
        s.orders_id,
        s.pdt_id,
        CAST(s.quantity AS INT64) AS quantity,
        CAST(p.purchase_price AS FLOAT64) AS purchase_price,
        CAST(s.revenue AS FLOAT64) AS revenue,
        -- 计算采购成本
        CAST(s.quantity AS INT64) * CAST(p.purchase_price AS FLOAT64) AS purchase_cost,
        -- 计算利润
        CAST(s.revenue AS FLOAT64) - (CAST(s.quantity AS INT64) * CAST(p.purchase_price AS FLOAT64)) AS margin
    FROM {{ ref('stg_raw__sales') }} AS s
    LEFT JOIN {{ ref('stg_raw__product') }} AS p
    ON s.pdt_id = p.products_id
)

SELECT *
FROM joined


