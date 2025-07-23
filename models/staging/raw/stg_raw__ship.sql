WITH source AS (
    SELECT *
    FROM {{ source('raw', 'ship') }}
),

renamed AS (
    SELECT
        order_id,
        shipping_fee,
        CAST(ship_cost AS FLOAT64) AS ship_cost,
        created_at
    FROM source
)

SELECT * FROM renamed

