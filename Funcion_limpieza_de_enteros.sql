CREATE OR REPLACE FUNCTION keepcoding.clean_integer(value_to_clean INT64)
RETURNS INT64 AS
((SELECT IF(value_to_clean IS NULL, -999999,value_to_clean)));


SELECT
    keepcoding.clean_integer(NULL)
  , keepcoding.clean_integer(125)
  , keepcoding.clean_integer(0)
  , keepcoding.clean_integer(-123);