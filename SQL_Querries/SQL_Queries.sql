create database Media_data;
use media_data;
select *from facebook_data;
select *from google_ads_data;
select *from linkedin_data;

select count(*) from facebook_data;
select count(*) from google_ads_data;
select count(*) from linkedin_data;

###--- Facebook_data----- QA----

##Total_Ads_Cost 
SELECT 
    CONCAT('$ ', FORMAT(SUM(totalcost) / 1000, 2), ' K') AS Total_Ads_Cost
FROM facebook_data;

##Total People Reached--- Total_People_Reached_(Expression)
SELECT 
    concat('$ ', format(SUM(Total_People_Reached)/1000000, 2), ' M') AS Total_People_reached
FROM facebook_data;

##Total Impressions

select
concat('$ ', format(sum(impressions)/1000000,2),' M') as Total_Impressions 
from facebook_data;

##Click-Through Rate (CTR%).

SELECT 
    concat(ROUND((SUM(CAST(REPLACE(Total_Link_Clicks, ',', '') AS UNSIGNED)) 
	/ NULLIF(SUM(Impressions), 0)) * 100, 2), '%') AS CTR_Percentage
FROM facebook_data;

###--- google_ads_data----- QA----

##Impressions
select 
concat(format(sum(ad_impressions)/1000000,2),' M') as Ad_Impressions 
from google_ads_data;

##Total_ad_Cost

Select
concat('$ ', format(sum(ad_cost_usd)/1000000,2),' M') as Total_Ad_Cost 
from google_ads_data;

##Conversion Value
Select
concat('$ ', format(sum(ad_conversion_value)/1000000,2),' M') as Total_Ad_Cost 
from google_ads_data;

##Cost per Click (CPC) 
SELECT 
    CONCAT('$ ', ROUND(SUM(ad_cost_usd) / NULLIF(SUM(ad_clicks), 0), 2)) AS Cost_per_Click 
FROM google_ads_data;


###--- linkedin_data----- QA----

##Total Posts
Select 
count(postdescription) as Total_Posts from linkedin_data;

##Total Views
Select
concat(format(sum(Views)/1000000,2),' M') as Total_Views from Linkedin_data;

##Engagement Rate
SELECT 
    Concat(ROUND((SUM(Comments) + SUM(Reactions) + SUM(Reposts)) 
        / NULLIF(SUM(Followers), 0) * 100, 
    2),' %') AS Engagement_Rate
FROM linkedin_data;

##Best_Day_to_Post
SELECT 
    Day_Of_Week,
    ROUND(AVG(Engagement_rate), 2) AS Avg_Engagement
FROM linkedin_data
GROUP BY Day_Of_Week
ORDER BY Avg_Engagement DESC;


