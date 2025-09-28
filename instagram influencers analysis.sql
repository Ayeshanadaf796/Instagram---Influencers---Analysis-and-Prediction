SELECT * FROM instagram_influencers_cleaned;

-- Distribution of followers
SELECT
country,
AVG(followers) AS avg_followers,
MAX(followers) AS max_followers,
MIN(followers) AS min_followers
FROM instagram_influencers_cleaned
GROUP BY country
ORDER BY country DESC;


-- Top influencers based on influence_score
SELECT
`rank`,
channel_info,
influence_score,
followers,
avg_likes
FROM instagram_influencers_cleaned
ORDER BY influence_score DESC
LIMIT 10;

-- Engagement rate statistics
SELECT
AVG(60_day_eng_rate) AS avg_eng_rate,
MAX(60_day_eng_rate) AS max_eng_rate,
MIN(60_day_eng_rate) AS min_eng_rate
FROM instagram_influencers_cleaned;

-- Influencers with high engagement but relatively  low followers
SELECT 
channel_info,
followers,
60_day_eng_rate
FROM instagram_influencers_cleaned
WHERE followers < 5000000
AND 60_day_eng_rate > 5
ORDER BY 60_day_eng_rate DESC;

-- Growth potential(new post like analysis)
SELECT
channel_info,
avg_likes,
new_post_avg_like
FROM instagram_influencers_cleaned
WHERE new_post_avg_like > avg_likes * 1.1
ORDER BY new_post_avg_like;

-- average influence score by country
SELECT
country,
AVG(influence_score) AS avg_influence_score
FROM instagram_influencers_cleaned
GROUP BY country
ORDER BY avg_influence_score DESC;






