# IVR Data Pipeline: SQL, ETL, and Data Warehousing

## About this project

This project focuses on building a data model for an IVR (Interactive Voice Response) system for customer service 
using SQL and Data Warehousing techniques. The work includes exploring data, creating structured tables (ivr_calls, 
ivr_modules, ivr_steps) within a dataset, defining relationships between them, and generating a detailed ivr_detail 
table. Several fields are obtained, and an ivr_summary table is created to consolidate key IVR metrics per call. 
The final step involves implementing a data-cleaning function for handling integer values.

## Tools:

* BigQuery

## Files description:

* [1_Create_ivr_detail_table.sql](https://github.com/luherod/IVR_Data_Pipeline_-_SQL_ETL_Data-Warehousing/blob/main/1_Crear_tabla_ivr_detail.sql): creation of the ivr_calls, ivr_modules, and ivr_steps tables, and creation of the ivr_detail table based on the previous ones.

* [2_Generate_vdn_aggregation_field.sql](https://github.com/luherod/IVR_Data_Pipeline_-_SQL_ETL_Data-Warehousing/blob/main/2_Generar_campo%20_vdn_aggregation.sql): creation of the vdn_aggregation field: FRONT if vdn_label starts with ATC, TECH if it starts with TECH, ABSORPTION if it is ABSORPTION, RESTO in other cases.

* [3_Generate_document_type_document_identification_fields.sql](https://github.com/luherod/IVR_Data_Pipeline_-_SQL_ETL_Data-Warehousing/blob/main/3_Generar%20campos_document_type_document_identification.sql): generation of document_type and document_identification fields for each call, ensuring that there is a single customer identified per call.

* [4_Generate_customer_phone_field.sql](https://github.com/luherod/IVR_Data_Pipeline_-_SQL_ETL_Data-Warehousing/blob/main/4_Generar_campo_customer_phone.sql): generation of the customer_phone field for each call, ensuring that there is a single customer identified per call.

* [5_Generate_billing_account_id_field.sql](https://github.com/luherod/IVR_Data_Pipeline_-_SQL_ETL_Data-Warehousing/blob/main/5_Generar_campo_billing_account_id.sql): generation of the billing_account_id field for each call, ensuring that there is a single customer identified per call.

* [6_Generate_masiva_lg_field.sql](https://github.com/luherod/IVR_Data_Pipeline_-_SQL_ETL_Data-Warehousing/blob/main/6_Generar_campo_masiva_lg.sql): generation of the masiva_lg field with a record for each call and a flag indicating whether the call passed through the AVERIA_MASIVA module (1) or not (0).

* [7_Generate_info_by_phone_lg_field.sql](https://github.com/luherod/IVR_Data_Pipeline_-_SQL_ETL_Data-Warehousing/blob/main/7_Generar_campo_info_by_phone_lg.sql): generation of the info_by_phone_lg field with a record for each call and a flag (positive: 1 / negative: 0) indicating if the call passed through the CUSTOMERINFOBYPHONE.TX step and if its step_result is OK.

* [8_Generate_info_by_dni_lg_field.sql](https://github.com/luherod/IVR_Data_Pipeline_-_SQL_ETL_Data-Warehousing/blob/main/8_Generar_campo_info_by_dni_lg.sql): generation of the info_by_dni_lg field with a record for each call and a flag (positive: 1 / negative: 0) indicating if the call passed through the CUSTOMERINFOBYDNI.TX step and if its step_result is OK.

* [9_Generate_repeated_phone_24h_cause_recall_phone_24h_fields.sql](https://github.com/luherod/IVR_Data_Pipeline_-_SQL_ETL_Data-Warehousing/blob/main/9_Generar_campos_repeated_phone_24h_cause_recall_phone_24h.sql): generation of the repeated_phone_24H and cause_recall_phone_24H fields with a record for each call and two flags (positive: 1 / negative: 0) indicating if the calls_phone_number has had a call in the previous 24 hours or the following 24 hours.

* [10_Create_ivr_summary_table.sql](https://github.com/luherod/IVR_Data_Pipeline_-_SQL_ETL_Data-Warehousing/blob/main/10_Crear_tabla_ivr_summary.sql): Create ivr_summary as a summary table for the call, including its most important indicators.

* [Integer_cleaning_function.sql](https://github.com/luherod/IVR_Data_Pipeline_-_SQL_ETL_Data-Warehousing/blob/main/Funcion_limpieza_de_enteros.sql): integer cleaning function that returns -999999 if a null is passed to the function.

* [ivr_calls.csv](https://github.com/luherod/IVR_Data_Pipeline_-_SQL_ETL_Data-Warehousing/blob/main/ivr_calls.csv): CSV with starting data related to the calls.

* [ivr_modules.csv](https://github.com/luherod/IVR_Data_Pipeline_-_SQL_ETL_Data-Warehousing/blob/main/ivr_modules.csv): CSV with starting data related to the different modules the call goes through.

* [ivr_steps.csv](https://github.com/luherod/IVR_Data_Pipeline_-_SQL_ETL_Data-Warehousing/blob/main/ivr_steps.csv): CSV with starting data related to the steps the user takes within a module.

## Author

Lucía Herrero Rodero.
