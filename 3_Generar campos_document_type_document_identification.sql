CREATE OR REPLACE TABLE keepcoding.ivr_customer_identification AS
SELECT
    calls_ivr_id
  , IFNULL(document_type,'UNKNOWN') AS document_type
  , IFNULL(document_identification,'UNKNOWN') AS document_identification
FROM(
 SELECT
     calls_ivr_id
   , CASE WHEN document_type='UNKNOWN' THEN NULL
          WHEN document_type='DESCONOCIDO' THEN NULL
          ELSE document_type
          END AS document_type
   , NULLIF(document_identification,'UNKNOWN') AS document_identification
   , ROW_NUMBER()OVER (PARTITION BY calls_ivr_id ORDER BY document_type,document_identification) AS row_number
 FROM `keepcoding.ivr_detail`
)
WHERE row_number=1;

SELECT *
FROM `keepcoding.ivr_customer_identification`;