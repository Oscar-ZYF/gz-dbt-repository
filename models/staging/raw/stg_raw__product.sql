WITH source AS (
    SELECT *
    FROM {{ source('raw', 'product') }}
),

renamed AS (
    SELECT
        product_id,
        CAST(purchse_price AS FLOAT64) AS purchase_price,
        product_name,
        category,
        created_at
    FROM source
)

SELECT * FROM renamed

