CREATE database playstore_apps;

-- 1. Which apps have the highest rating in the given available dataset?
SELECT App,Rating FROM apps 
WHERE Rating=(SELECT MAX(Rating) FROM apps);

-- 2. What are the number of installs and reviews for the above apps?Return the apps with the highest reviews to the top.
SELECT App,Installs,Reviews FROM apps
WHERE Rating=(SELECT MAX(Rating) FROM apps)
ORDER BY Reviews DESC;

-- 3. Which app has the highest number of reviews? Also, mention the number of reviews and category of the app?
SELECT App,Reviews,Category FROM apps
WHERE Reviews=(SELECT MAX(Reviews) FROM apps);

-- 4. What is the total amount of revenue generated by the google play store by hosting apps? (Whenever a user buys apps from thegoogle play store, the amount is considered in the revenue)
SELECT SUM(Price*Installs) AS TotalRevenue FROM apps;

-- 5. Which Category of google play store apps has the highest number of installs? also, find out the total number of installs for that particular category.
SELECT DISTINCT(Category) AS category,SUM(Installs) AS Total_Installs FROM apps
WHERE Installs=(SELECT MAX(Installs) FROM apps)
GROUP BY category;

-- 6. Which Genre has the most number of published apps?
SELECT Genres,COUNT(App) AS APPCOUNT FROM apps
GROUP BY Genres
ORDER BY APPCOUNT DESC LIMIT 1;

-- 7. Provide the list of all games ordered in such a way that the game that has the highest number of installs is displayed on the top(to avoid duplicate results use distinct)
SELECT DISTINCT(App),Installs FROM apps
WHERE Category="GAME" 
ORDER BY Installs DESC;

-- 8. Provide the list of apps that can work on android version 4.0.3 and UP.
SELECT App,`Android Ver` FROM apps
WHERE `Android Ver` ='4.0.3 and up';

-- 9.  How many apps from the given data set are free? Also, provide the number of paid apps.
SELECT
COUNT(CASE WHEN Type = 'Free' THEN 1 ELSE NULL END) AS FREEAPPS,
COUNT(CASE WHEN Type = 'Paid' THEN 1 ELSE NULL END) AS PAIDAPPS
FROM apps;

-- 10. Which is the best dating app? (Best dating app is the one having the highest number of Reviews)
SELECT App,Reviews FROM apps
WHERE Category='DATING'
ORDER BY Reviews DESC LIMIT 1;

-- 11. Get the number of reviews having positive sentiment and number of reviews having negative sentiment for the app 10 best foods for you and compare them.
SELECT
COUNT(CASE WHEN Sentiment = 'Positive' THEN 1 ELSE NULL END) AS POSITIVE,
COUNT(CASE WHEN Sentiment = 'Negative' THEN 1 ELSE NULL END) AS NEGATIVE
FROM reviews 
WHERE App='10 Best Foods for You'
GROUP BY App;

-- 12. Which comments of ASUS SuperNote have sentiment polarity and sentiment subjectivity both as 1?
SELECT Translated_Review FROM reviews
WHERE App='ASUS SuperNote' and Sentiment_Polarity=1 and Sentiment_Subjectivity=1;

-- 13. Get all the neutral sentiment reviews for the app Abs Training Burn belly fat?
SELECT Translated_Review FROM reviews
WHERE App='Abs Training Burn belly fat' and Sentiment='Neutral';

-- 14. Extract all negative sentiment reviews for Adobe Acrobat Reader with their sentiment polarity and sentiment subjectivity?
SELECT Translated_Review,Sentiment_Polarity,Sentiment_Subjectivity FROM reviews
WHERE App='Adobe Acrobat Reader' and Sentiment='Negative';