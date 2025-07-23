WITH order_summary AS (
    SELECT
        s.orders_id,
        MAX(s.date_date) AS date_date,   -- 如果订单有多行，用 MAX/MIN 取一个日期
        SUM(s.revenue) AS revenue,
        SUM(s.quantity) AS quantity,
        SUM(s.purchase_cost) AS purchase_cost,
        SUM(s.margin) AS margin
    FROM {{ ref('int_sales_margin') }} AS s
    GROUP BY s.orders_id
)

SELECT *
FROM order_summary
ORDER BY orders_id
