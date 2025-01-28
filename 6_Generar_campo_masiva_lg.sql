CREATE TABLE keepcoding.ivr_massive_breakdown_indicator AS
 SELECT
     ivr_id as calls_ivr_id
    , IF(module_aggregation LIKE '%AVERIA_MASIVA%',1,0) AS masiva_lg
  FROM `keepcoding.ivr_calls`;

SELECT *
 FROM keepcoding.ivr_massive_breakdown_indicator;