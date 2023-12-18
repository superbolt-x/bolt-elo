{{ config (
    alias = target.database + '_ga4_location_performance'
)}}

SELECT 
profile,
continent,
country,
region,
city,
date,
date_granularity,
new_users,
sessions,
average_session_duration,
engaged_sessions,
bounce_rate,
session_duration,
bounced_sessions,
purchase
FROM {{ ref('ga4_performance_by_city') }}
