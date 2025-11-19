{{ config(materialized='table') }}


SELECT DISTINCT
    account_id,
    person_id
FROM {{ ref('stg_sf_contacts') }}
WHERE account_id IS NOT NULL

