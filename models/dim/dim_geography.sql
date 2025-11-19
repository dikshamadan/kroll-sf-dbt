{{config(materialized="table")}}

SELECT
    geo_id,
    city,
    country,
    region
FROM 
{{ ref('stg_ga4') }}
