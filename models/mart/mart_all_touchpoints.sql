{{ config(materialized='view') }}

with all_touchpoints as (

    select
        'GA4' as tp_source,
        session_id as tp_id,
        account_id,
        null as person_id,
        null as campaign_id,
        null as channel_id,
        null as content_id,
        null as keyword_id,
        geo_id,
        event_date as tp_datetime,
        'session_start' as touch_type,
        1 as value,
        null as cost,
        null as service_line_code
    from {{ ref('fact_web_session') }}

    union all

    select
        'Eloqua' as tp_source,
        email_send_id as tp_id,
        account_id,
        person_id,
        campaign_id,
        null as channel_id,
        null as content_id,
        null as keyword_id,
        null as geo_id,
        click_datetime as tp_datetime,
        'email_click' as touch_type,
        1 as value,
        null as cost,
        null as service_line_code
    from {{ ref('fact_email_event') }} 
    

    union all


    select
        'CRM' as tp_source,
        sf_activity_id as tp_id,
        account_id,
        person_id,
        null as campaign_id,
        null as channel_id,
        null as content_id,
        null as keyword_id,
        null as geo_id,
        activity_date as tp_datetime,
        activity_type as touch_type,
        1 as value,
        null as cost,
        null as service_line_code
    from {{ ref('fact_crm_activity') }}

)

select 
        a.tp_source,
        a.tp_id,
        a.account_id,
        a.person_id,
        a.campaign_id,
        a.channel_id,
        a.content_id,
        a.keyword_id,
        a.geo_id,
        a.tp_datetime,
        a.touch_type,
        a.value,
        a.cost,
        a.service_line_code
from all_touchpoints a
LEFT JOIN
{{ref ('dim_person')}} p ON a.person_id = p.person_id
LEFT JOIN
{{ref ('dim_campaign')}} c ON c.campaign_id = a.campaign_id
LEFT JOIN
{{ref ('dim_content')}} c ON c.content_id = a.content_id
LEFT JOIN
{{ref ('dim_geography')}} g on g.geo_id = a.geo_id
LEFT join
{{ref ('bridge_service_line_abm_account')}} b ON b.account_id = a.account_id
LEFT join
{{ref ('dim_date')}} d on d.event_date = a.tp_datetime
