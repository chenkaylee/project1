-- Query 1: join of at least three tables
-- Finds the most common category for each LimitedEditionLine

SELECT 
    LimitedEditionLines.name,
    Categories.name,
    COUNT(*) AS CategoryCount
FROM LimitedEditionLines
JOIN Products ON LimitedEditionLines.line_id = Products.line_id
JOIN Categories ON Products.category_id = Categories.category_id
GROUP BY LimitedEditionLines.name, Categories.name
ORDER BY LimitedEditionLines.name, CategoryCount DESC;