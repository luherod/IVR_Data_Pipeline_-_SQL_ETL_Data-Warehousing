CREATE OR REPLACE TABLE keepcoding.ivr_info_by_phone_indicator AS
 SELECT
    calls_ivr_id
   , info_by_phone_lg
  FROM(
   SELECT
       calls_ivr_id
     , info_by_phone_lg
     , ROW_NUMBER()OVER (PARTITION BY calls_ivr_id ORDER BY info_by_phone_lg DESC) AS row_number
    FROM( 
     SELECT
         ivr_id as calls_ivr_id
       , step_name
       , step_result
       , IF(step_name='CUSTOMERINFOBYPHONE.TX' AND step_result='OK',1,0) AS info_by_phone_lg
      FROM `keepcoding.ivr_steps`
    )
  )
  WHERE row_number=1;

SELECT *
 FROM keepcoding.ivr_info_by_phone_indicator;