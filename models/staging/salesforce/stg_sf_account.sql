{{ config(materialized='view') }}


SELECT
    LOWER(account_id) AS account_id,
    LOWER(sf_account_id) AS sf_account_id,
    account_name,
    domain_root,
    industry_std as industry,
    demandbase_company_id,
    demandbase_company_name,
    is_abm_account,
    service_line_code

FROM {{ source('abm_raw', 'salesforce_raw') }}
WHERE object_type = 'Account'



