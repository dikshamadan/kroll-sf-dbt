{{config(materialized="table")}}

SELECT
    content_id,
    page_url,
    ga4_content_key,
    site_section
FROM {{ref('stg_ga4')}}