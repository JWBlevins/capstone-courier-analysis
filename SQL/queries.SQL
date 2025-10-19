--1. ON-time rate by shipment.
SELECT Mode_of_Shipment,
    AVG(Late_Indicator)*1.0 AS late_rate,
    COUNT(*) AS shipments
FROM courier_data
GROUP BY Mode_of_Shipment
ORDER BY late_rate;

--2 Average cost by weight category.
SELECT CASE
        WHEN Weight_in_kgs < 2000 THEM 'Light'
        WHEN Weight_in_kgs < 4000 THEM 'Medium'
        ELSE 'Heavy'
        END AS Weight_Category,
        AVG(Cost_of_the_Product) AS avg_cost,
        COUNT(*) AS shipments
FROM courier_data
GROUP BY Weight_Category;

--3. Join courier data with freight index.
SELECT c.Date,
       AVG(c.Cost_of_the_Product) AS avg_cost,
       AVG(c.Custoemr_Rating) AS avg_rating,
       AVG(c.Late_Indicator)*1.0 AS late_rate,
FROM courier_data c
JOIN freight_tsi t ON c.Date = t.observation_date
WHERE BY c.Date
ORDER BY c.Date;
