{{ config(materialized='view') }}

select * from 
{{ source('abm_raw', 'ga4_raw') }}
limit 10