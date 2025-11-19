{{ config(materialized='table') }}

SELECT 
    ga.campaign_id,
    ga.utm_source,
    ga.account_id,
    ga.sf_account_id,
    elq.event_type,
    elq.person_id
FROM 
{{ ref('stg_ga4')}} ga
JOIN
{{ref('stg_elq_email_events')}} elq USING (account_id)