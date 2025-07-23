WITH source AS (
    SELECT *
    FROM {{ source('raw', 'sales') }}
),

renamed AS (
    SELECT
        order_id,
        customer_id,
        pdt_id AS products_id,  -- 将 pdt_id 重命名为 products_id
        amount,
        margin,
        operational_margin,
        created_at
    FROM source
)

SELECT *
FROM renamed

