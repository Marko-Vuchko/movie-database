-- Analiza žanrova i preporuke za investicije
SELECT g.name AS genre, SUM(m.box_office - m.budget) AS profit
FROM movie m
JOIN genre g ON m.genre_id = g.genre_id
GROUP BY g.name
ORDER BY profit DESC
LIMIT 3;

-- Veza između budžeta i zarade
SELECT m.budget, m.box_office AS revenue
FROM movie m
WHERE m.budget IS NOT NULL AND m.box_office IS NOT NULL;

-- Analiza zemalja produkcije
SELECT c.name AS country, AVG(m.box_office) AS avg_revenue
FROM movie m
JOIN country c ON m.country_id = c.country_id
GROUP BY c.name
ORDER BY avg_revenue DESC
LIMIT 5;

-- Najuspešniji filmovi
SELECT m.title, m.box_office AS revenue
FROM movie m
ORDER BY revenue DESC
LIMIT 10;
