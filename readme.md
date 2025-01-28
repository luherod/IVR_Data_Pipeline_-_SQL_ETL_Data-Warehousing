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

* [](): creacción de tablas ivr_calls, ivr_modules, e ivr_steps y creación de la tabla ivr_detail a partir de las 
anteriores.

* [](): creación del campo campo vdn_aggregation: FRONT si vdn_label empieza por ATC, TECH si empieza por TECH, 
ABSORTION si es ABSORPTION, RESTO en otros casos.

* [](): generación de campos document_type y document_identification para cada llamada, de modo que para cada 
llamada haya un único cliente identificado.

* [](): generar el campo customer_phone por cada llamada, de forma que haya un sólo cliente identificado para la 
misma.

* [](): generar el campo billing_account_id por cada llamada, de forma que haya un sólo cliente identificado para 
la misma.

* [](): generar el campo masiva_lg con un registro por cada llamada y un flag que indique si la llamada ha pasado 
por el módulo AVERIA_MASIVA (1) o no (0).

* [](): generar el campo info_by_phone_lg con un registro por cada llamada y un flag (afirmativo: 1 / negativo:0) 
que indique si la llamada pasa por el step CUSTOMERINFOBYPHONE.TX y su step_result es OK.

* [](): generar el campo info_by_dni_lg con un registro por cada llamada y un flag (afirmativo: 1 / negativo:0) 
que indique si la llamada pasa por el step CUSTOMERINFOBYDNI.TX y su step_result es OK.

* [](): generar los campos repeated_phone_24H, cause_recall_phone_24H con un registro por cada llamada y dos flags 
(afirmativo: 1 / negativo:0) que indiquen si el calls_phone_number tiene una llamada las anteriores 24 horas o en
las siguientes 24 horas. 

* [](): Crear ivr_summary como tabla resumen de la llamada donde se incluyen sus indicadores más importantes.

* [](): función de limpieza de enteros que devuelve devuelva el valor -999999 si entra un null la función 

## Author

Lucía Herrero Rodero.
