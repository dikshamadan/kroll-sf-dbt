{{ config(materialized='table') }}

WITH abm_accounts AS (
    SELECT
        a.account_id,
        b.service_line_code,
        a.is_abm_account
    FROM {{ ref('dim_account') }} a
    JOIN {{ref('bridge_service_line_abm_account')}} b
    WHERE a.is_abm_account = TRUE
),

pipeline AS (
    SELECT
        o.account_id,
        SUM(CASE WHEN is_closed = FALSE THEN amount ELSE 0 END) AS abm_pipeline_open,
        SUM(CASE WHEN is_won   = TRUE  THEN amount ELSE 0 END) AS abm_pipeline_won
    FROM {{ ref('fact_opportunity') }} o
    JOIN abm_accounts a
      ON a.account_id = o.account_id
    GROUP BY 1
),


by_sl AS (
    SELECT
        a.service_line_code,
        COUNT(DISTINCT a.account_id)           AS abm_accounts,
        COALESCE(SUM(p.abm_pipeline_open), 0) AS abm_pipeline_open,
        COALESCE(SUM(p.abm_pipeline_won), 0)  AS abm_pipeline_won
       
    FROM abm_accounts a
    LEFT JOIN pipeline p
      ON a.account_id = p.account_id

    GROUP BY 1
)

SELECT
    s.service_line_code,
    s.abm_accounts,
    s.abm_pipeline_open,
    s.abm_pipeline_won
   
FROM by_sl s;
