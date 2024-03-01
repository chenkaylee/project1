-- Query 2: Contains a subquery
-- Lists products that are currently offered as part of an active Limited Edition Line

SELECT 
    Products.product_id,
    Products.name,
    Products.price,
    LimitedEditionLines.name
FROM Products
WHERE 
    Prooducts.line_id IN (
        SELECT line_id 
        FROM LimitedEditionLines 
        WHERE end_date > CURDATE()
    );