{{ config(materialized='view') }}


SELECT
    LOWER(account_id) AS account_id,
    LOWER(sf_account_id) AS sf_account_id,
    LOWER(opportunity_id) AS opportunity_id,
    close_date,
    amount,
    is_closed,
    is_won,
    is_abm_opportunity

FROM {{ source('abm_raw', 'salesforce_raw') }}
WHERE object_type = 'Opportunity'