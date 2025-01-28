CREATE OR REPLACE TABLE keepcoding.ivr_billing_account AS
SELECT
    calls_ivr_id
  , IFNULL(billing_account_id,'UNKNOWN') AS billing_account_id
FROM(
 SELECT
     calls_ivr_id
   , NULLIF(billing_account_id,'UNKNOWN') AS billing_account_id
   , ROW_NUMBER()OVER (PARTITION BY calls_ivr_id ORDER BY billing_account_id) AS row_number
 FROM `keepcoding.ivr_detail`
)
WHERE row_number=1;

SELECT *
 FROM `keepcoding.ivr_billing_account`;