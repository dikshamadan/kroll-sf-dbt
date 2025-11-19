{{config(materialized='table')}}

SELECT 
    event_date
FROM {{ref('stg_ga4')}}