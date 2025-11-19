{{config(materialized='table')}}

SELECT 
    session_id,
    account_id,
    user_pseudo_id,
    referrer,
    conversions,
    gclid,
    geo_id,
    event_date,
    engaged_time_sec,
    session_engaged_pages,
    user_type
FROM {{ref('stg_ga4')}}