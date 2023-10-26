{{ config (
    alias = target.database + '_tiktok_campaign_performance'
)}}

SELECT 
campaign_name,
campaign_id,
campaign_status,
CASE WHEN campaign_name ~* 'prospecting' THEN 'Campaign Type: Prospecting'
WHEN campaign_name ~* 'retargeting' THEN 'Campaign Type: Retargeting'
END as campaign_type_default,
CASE WHEN campaign_name ~* 'Protein' THEN 'Campaign Type: Protein'
WHEN campaign_name ~* 'Gummies' THEN 'Campaign Type: Gummies'
END as campaign_type_custom,
date,
date_granularity,
cost as spend,
impressions,
clicks,
add_payment_info_events as add_payment_info,
complete_payment_events as purchases
FROM {{ ref ('tiktok_performance_by_campaign') }}
