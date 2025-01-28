CREATE OR REPLACE TABLE keepcoding.ivr_vdn_aggregation AS
 SELECT 
    ivr_id as calls_ivr_id
  , CASE 
      WHEN STARTS_WITH(vdn_label, 'ATC') THEN 'FRONT'
      WHEN STARTS_WITH(vdn_label, 'TECH') THEN 'TECH'
      WHEN vdn_label = 'ABSORPTION' THEN 'ABSORPTION'
      ELSE 'RESTO'
    END AS vdn_aggregation
 FROM `keepcoding.ivr_calls`;

SELECT *
 FROM `keepcoding.ivr_vdn_aggregation`;
