{{ config(materialized='view') }}


SELECT 

    session_id,
    user_pseudo_id,
    referrer,
    conversions,
    gclid,
    user_type,
    engaged_time_sec,
    event_date,
    page_url,
    ga4_content_key,
    site_section,
    domain_root,
    campaign_id,
    campaign_source AS utm_source,
    content_id,
    keyword_id,
    city31 as city,
    country32 as country,
    global_region as region,
    demandbase_company_id,
    demandbase_company_name,
    demandbase_industry,
    demandbase_audience,
    session_engaged_pages,
    LOWER(account_id) AS account_id,
    LOWER(sf_account_id) AS sf_account_id

FROM {{ source('abm_raw','ga4_raw') }}

  
