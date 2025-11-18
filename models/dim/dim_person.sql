{{ config(materialized='table') }}

WITH sf_contacts AS (
    SELECT *
    FROM {{ ref('stg_sf_contacts') }}
),
elq_contacts AS (
    SELECT *
    FROM {{ ref('stg_elq_contacts') }}
)

SELECT
    person_id,
    sf_contact_id,
    eloqua_contact_id,
    email,
    job_title

FROM (
    SELECT
        person_id,
        sf_contact_id,
         eloqua_contact_id,
        email,
        job_title
    FROM sf_contacts

    UNION DISTINCT

    SELECT
        person_id,
        sf_contact_id,
        eloqua_contact_id,
       email,
        job_title
    FROM elq_contacts
);
