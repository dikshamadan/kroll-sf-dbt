{{ config(materialized='view') }}


SELECT
    LOWER(account_id) AS account_id,
    LOWER(sf_account_id) AS sf_account_id,
    LOWER(person_id) AS person_id,
    LOWER(sf_contact_id) AS sf_contact_id,
    LOWER(sf_activity_id) AS sf_activity_id,
    activity_date,
    activity_type
    
FROM {{ source('abm_raw', 'salesforce_raw') }}
WHERE object_type = 'Activity'