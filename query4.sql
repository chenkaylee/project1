-- Query 4: contains a complex search criterion (more than one expression with logical connectors)
-- This query will find all the products that are either:
-- Priced above 1000 and made of 'Leather', or
-- Part of a Limited Edition Line that ended in the past year.

SELECT
    Products.product_id,
    Products.name,
    Products.price,
    Products.material,
    LimitedEditionLines.name,
    LimitedEditionLines.end_date
FROM Products
LEFT JOIN LimitedEditionLines ON Products.line_id = LimitedEditionLines.line_id
WHERE 
    (Products.price > 1000 AND Products.material = 'Leather') OR
    (LimitedEditionLines.end_date BETWEEN DATE_SUB(CURDATE(), INTERVAL 1 YEAR) AND CURDATE());