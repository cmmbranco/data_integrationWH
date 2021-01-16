

SELECT category, sum(a.measure)
FROM
(select measure,category from D_Film as df
RIGHT JOIN 
fact_sales as fs
ON
fs.film_id = df.film_id) as a

GROUP BY

a.category

;
