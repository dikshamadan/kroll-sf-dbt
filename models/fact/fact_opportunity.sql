{{config(materialized='table')}}

SELECT
    opportunity_id,
    account_id,
    close_date,
    amount,
    is_closed,
    is_won,
    is_abm_opportunity
FROM {{ref('stg_sf_opportunities')}}