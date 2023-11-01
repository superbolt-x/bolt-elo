{{ config (
    alias = target.database + '_facebook_ad_performance'
)}}

SELECT 
campaign_name,
campaign_id,
campaign_effective_status,
campaign_type_default,
CASE WHEN campaign_name ~* 'Protein' THEN 'Campaign Type: Protein'
WHEN campaign_name ~* 'Gummies' THEN 'Campaign Type: Gummies'
END as campaign_type_custom,
adset_name,
adset_id,
adset_effective_status,
audience,
ad_name,
ad_id,
ad_effective_status,
visual,
copy,
format_visual,
visual_copy,
date,
date_granularity,
spend,
impressions,
link_clicks,
add_to_cart,
purchases,
revenue,
add_payment_info,
landing_page_view as landing_page_views,
CASE WHEN date >= '2023-10-23' THEN "offsite_conversion.fb_pixel_custom.typeformsubmit" END as typeform_submissions,
CASE WHEN date >= '2023-10-23' THEN "offsite_conversion.fb_pixel_custom.typeformfirstinteraction" END as typeform_clicked
FROM {{ ref('facebook_performance_by_ad') }}
