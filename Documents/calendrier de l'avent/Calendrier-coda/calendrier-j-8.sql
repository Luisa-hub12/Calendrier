-- Top 3 des enfants les plus sages
WITH top3 AS (
    SELECT
        c.id,
        c.first_name,
        c.last_name,
        b.nice_score
    FROM children c
    JOIN behavior b ON c.id = b.child_id
    WHERE b.year = 2025
    ORDER BY b.nice_score DESC
    LIMIT 3
)
SELECT * FROM top3;


-- Localisation + coordonnées des 3 enfants les plus sages
WITH top3 AS (
    SELECT
        c.id,
        c.first_name,
        c.last_name,
        b.nice_score
    FROM children c
    JOIN behavior b ON c.id = b.child_id
    WHERE b.year = 2025
    ORDER BY b.nice_score DESC
    LIMIT 3
)
SELECT
    t.first_name,
    t.last_name,
    t.nice_score,
    ci.name AS city,
    co.name AS country,
    h.address,
    ep.x_m,
    ep.y_m
FROM top3 t
JOIN households h ON t.id = h.id
JOIN cities ci ON h.city_id = ci.id
JOIN countries co ON ci.country_code = co.code
JOIN elf_plan ep ON t.id = ep.child_id;


-- Coordonnées pour afficher les enfants sur une carte
WITH top3 AS (
    SELECT
        c.id,
        c.first_name,
        c.last_name,
        b.nice_score
    FROM children c
    JOIN behavior b ON c.id = b.child_id
    WHERE b.year = 2025
    ORDER BY b.nice_score DESC
    LIMIT 3
)
SELECT
    t.first_name,
    t.last_name,
    t.nice_score,
    ci.name AS city,
    co.name AS country,
    ci.lat AS latitude,
    ci.lon AS longitude,
    ep.x_m,
    ep.y_m
FROM top3 t
JOIN households h ON t.id = h.id
JOIN cities ci ON h.city_id = ci.id
JOIN countries co ON ci.country_code = co.code
JOIN elf_plan ep ON t.id = ep.child_id;
