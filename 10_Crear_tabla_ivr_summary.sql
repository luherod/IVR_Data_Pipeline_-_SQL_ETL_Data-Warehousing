CREATE OR REPLACE TABLE keepcoding.ivr_summary AS
WITH detail AS
  (
   SELECT
       DISTINCT calls_ivr_id AS ivr_id
     , calls_phone_number AS phone_number
     , calls_ivr_result AS ivr_result
     , calls_start_date AS start_date
     , calls_end_date AS end_date
     , calls_total_duration AS total_duration
     , calls_customer_segment AS customer_segment
     , calls_ivr_language AS ivr_language
     , calls_steps_module AS steps_module
     , calls_module_aggregation AS module_aggregation
    FROM `keepcoding.ivr_detail`
  )
SELECT
    detail.ivr_id
  , detail.phone_number
  , detail.ivr_result
  , ivr_vdn_aggregation.vdn_aggregation
  , detail.start_date
  , detail.end_date
  , detail.total_duration
  , detail.customer_segment
  , detail.ivr_language
  , detail.steps_module
  , detail.module_aggregation
  , ivr_customer_identification.document_type
  , ivr_customer_identification.document_identification
  , ivr_customer_phone.customer_phone
  , ivr_billing_account.billing_account_id
  , ivr_massive_breakdown_indicator.masiva_lg
  , ivr_info_by_phone_indicator.info_by_phone_lg
  , ivr_info_by_dni_indicator.info_by_dni_lg
  , ivr_recalls.repeated_phone_24H
  , ivr_recalls.cause_recall_phone_24H
 FROM detail
 INNER JOIN `keepcoding.ivr_vdn_aggregation` AS ivr_vdn_aggregation
 ON detail.ivr_id=ivr_vdn_aggregation.calls_ivr_id
 INNER JOIN `keepcoding.ivr_customer_identification` AS ivr_customer_identification
 ON detail.ivr_id=ivr_customer_identification.calls_ivr_id
 INNER JOIN `keepcoding.ivr_customer_phone` AS ivr_customer_phone
 ON detail.ivr_id=ivr_customer_phone.calls_ivr_id
 INNER JOIN `keepcoding.ivr_billing_account` AS ivr_billing_account
 ON detail.ivr_id=ivr_billing_account.calls_ivr_id
 INNER JOIN `keepcoding.ivr_massive_breakdown_indicator` AS ivr_massive_breakdown_indicator
 ON detail.ivr_id=ivr_massive_breakdown_indicator.calls_ivr_id
 INNER JOIN `keepcoding.ivr_info_by_phone_indicator` AS ivr_info_by_phone_indicator
 ON detail.ivr_id=ivr_info_by_phone_indicator.calls_ivr_id
 INNER JOIN `keepcoding.ivr_info_by_dni_indicator` AS ivr_info_by_dni_indicator
 ON detail.ivr_id=ivr_info_by_dni_indicator.calls_ivr_id
 INNER JOIN `keepcoding.ivr_recalls` as ivr_recalls
 ON detail.ivr_id=ivr_recalls.calls_ivr_id

