CREATE OR REPLACE TABLE keepcoding.ivr_recalls AS
 SELECT
     ivr_id as calls_ivr_id
   , IF(
        DATE_SUB(start_date,INTERVAL 1 DAY)
        <=
        LAG(start_date) OVER (PARTITION BY phone_number ORDER BY start_date),
        1,0
        ) AS repeated_phone_24H
   , IF(
        DATE_ADD(start_date,INTERVAL 1 DAY)
        >=
        LEAD(start_date) OVER (PARTITION BY phone_number ORDER BY start_date),
        1,0
        ) AS cause_recall_phone_24H
  FROM `keepcoding.ivr_calls`;

SELECT *
 FROM `keepcoding.ivr_recalls`;