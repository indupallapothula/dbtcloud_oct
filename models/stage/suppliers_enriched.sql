{{ config(materialized='table') }}

SELECT
  stg.supplier_id,
  COALESCE(sup.sname, stg.supplier_name) AS supplier_name,
  stg.other_column1,
  stg.other_column2
FROM {{ ref('stg_suppliers') }} AS stg
LEFT JOIN {{ ref('suppliers') }} AS sup
  ON stg.supplier_name = sup.sname
