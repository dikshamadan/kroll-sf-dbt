{{ config(materialized='view') }}


SELECT
    LOWER(person_id) AS person_id,
    LOWER(sf_contact_id) AS sf_contact_id,
    LOWER(eloqua_contact_id) AS eloqua_contact_id,
    LOWER(account_id) AS account_id,
    LOWER(sf_account_id) AS sf_account_id,
    campaign_id,
    email_send_id,
    sent_date,
    sent_datetime,
    open_datetime,
    click_datetime,
    CASE
    WHEN object_type = 'EmailSend' THEN 'send'
    WHEN object_type = 'EmailOpen' THEN 'open'
    WHEN object_type = 'EmailClick' THEN 'click'
    END AS event_type

FROM {{source('abm_raw', 'eloqua_raw') }}
