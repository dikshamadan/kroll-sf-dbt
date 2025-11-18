{{ config(materialized='view') }}


SELECT
    LOWER(person_id) AS person_id,
    LOWER(sf_contact_id) AS sf_contact_id,
    LOWER(eloqua_contact_id) AS eloqua_contact_id,
    LOWER(account_id) AS account_id,
    LOWER(sf_account_id) AS sf_account_id,
    email,
    job_title
FROM {{source('abm_raw', 'eloqua_raw') }}
where object_type = 'Contact'

