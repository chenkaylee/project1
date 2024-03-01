-- Query 5
-- This query categorizes each sale based on the quantity sold, labeling them as 'Low', 'Medium', or 'High' volume. 

SELECT 
    sale_id,
    listing_id,
    sale_date,
    quantity_sold,
    CASE 
        WHEN quantity_sold < 50 THEN 'Low'
        WHEN quantity_sold BETWEEN 50 AND 100 THEN 'Medium'
        ELSE 'High'
    END AS sale_volume
FROM 
    SalesRecords;