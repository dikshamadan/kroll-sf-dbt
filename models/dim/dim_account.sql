{{config(materialized='table')}}

SELECT
sf_a.account_id,
sf_a.sf_account_id,
sf_a.demandbase_company_id,
sf_a.domain_root,
sf_a.industry,
ga.demandbase_company_name,
ga.demandbase_industry,
ga.demandbase_audience,
sf_a.is_abm_account

from {{ ref('stg_sf_account')}} sf_a
join
{{ ref("stg_ga4") }} ga USING (account_id)