{{ config (
    alias = target.database + '_googleads_campaign_performance'
)}}

SELECT 
account_id,
campaign_name,
campaign_id,
campaign_status,
campaign_type_default,
CASE WHEN campaign_name ~* 'Protein' THEN 'Campaign Type: Protein'
    WHEN campaign_name ~* 'Gummies' THEN 'Campaign Type: Gummies'
END as campaign_type_custom,
date,
date_granularity,
spend,
impressions,
clicks,
purchase as purchases,
purchase_value as revenue,
search_impression_share,
search_budget_lost_impression_share,
search_rank_lost_impression_share,
proceedtocheckoutproteinorsupplement as proceed_to_checkout
FROM {{ ref ('googleads_performance_by_campaign') }}
