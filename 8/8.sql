

SELECT category,city,sum(measure)
FROM
(SELECT dc.customer_id,dc.city,dc.DATE_FROM, dc.DATE_TO, b.measure,b.category,b.time_id
FROM
(select customer_id, city, DATE_FROM, DATE_TO
FROM D_Customer) as dc
INNER JOIN
(select fs.customer_id, measure,category,fs.time_id from D_Film as df
INNER JOIN 
fact_sales as fs
ON
fs.film_id = df.film_id) as b
ON
dc.customer_id = b.customer_id) as g
INNER JOIN
(SELECT time_id, timeid FROM D_Time) as h
ON g.time_id = h.timeid
WHERE DATE_FROM <= h.time_id
	and DATE_TO > h.time_id
GROUP BY
category,city WITH ROLLUP;