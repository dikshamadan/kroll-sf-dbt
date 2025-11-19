{{config(materialized='table')}}

SELECT
    email_send_id,
    person_id,
    account_id,
    campaign_id,
    sent_date,
    sent_datetime,
    open_datetime,
    click_datetime
FROM {{ref('stg_elq_email_events')}}