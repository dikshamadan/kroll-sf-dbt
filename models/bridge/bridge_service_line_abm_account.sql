{{config(materialized="table")}}

SELECT 
    account_id,
    sf_account_id,
    service_line_code
FROM {{ref('stg_sf_account')}}