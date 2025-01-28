CREATE OR REPLACE TABLE keepcoding.ivr_customer_phone AS
SELECT
    calls_ivr_id
  , IFNULL(customer_phone,'UNKNOWN') AS customer_phone
FROM(
 SELECT
     calls_ivr_id
   , NULLIF(customer_phone,'UNKNOWN') AS customer_phone
   , ROW_NUMBER()OVER (PARTITION BY calls_ivr_id ORDER BY customer_phone) AS row_number
 FROM `keepcoding.ivr_detail`
)
WHERE row_number=1;

SELECT *
 FROM `keepcoding.ivr_customer_phone`;