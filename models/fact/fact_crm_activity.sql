{{config(materialized='table')}}

SELECT 
    sf_activity_id,
    account_id,
    person_id,
    activity_date,
    activity_type
FROM {{ref('stg_sf_activities')}}

