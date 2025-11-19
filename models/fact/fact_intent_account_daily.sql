{{config(materialized='table')}}

SELECT 
    account_id,
    keyword_id,
    event_date
FROM {{ref('stg_ga4')}}