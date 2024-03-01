-- Query 3: Contains a GROUP BY and HAVING clause
-- Finds categories that have more than 10 products associated with them

SELECT
    Categories.category_id,
    Categories.name,
    COUNT(Products.product_id) as product_count
FROM Categories
JOIN Products ON Categories.category_id = Products.category_id
GROUP BY Categories.category_id
HAVING COUNT(Products.product_id) > 10;