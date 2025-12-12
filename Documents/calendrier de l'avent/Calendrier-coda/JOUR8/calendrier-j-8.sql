-- Tous les enfants avec le meilleur score en 2025
WITH max_score AS (
    SELECT MAX(nice_score) AS best_score
    FROM behavior
    WHERE year = 2025
)
SELECT
    c.first_name,
    c.last_name,
    b.nice_score
FROM children c
JOIN behavior b ON c.id = b.child_id
JOIN max_score m ON b.nice_score = m.best_score
WHERE b.year = 2025;

-- Localisation + coordonnées de tous les enfants ayant le meilleur score
WITH max_score AS (
    SELECT MAX(nice_score) AS best_score
    FROM behavior
    WHERE year = 2025
)
SELECT
    c.first_name,
    c.last_name,
    b.nice_score,
    ci.name AS city,
    co.name AS country,
    h.address,
    ep.x_m,
    ep.y_m,
    ci.lat AS latitude,
    ci.lon AS longitude
FROM children c
JOIN behavior b ON c.id = b.child_id
JOIN max_score m ON b.nice_score = m.best_score
JOIN households h ON c.household_id = h.id
JOIN cities ci ON h.city_id = ci.id
JOIN countries co ON ci.country_code = co.code
JOIN elf_plan ep ON c.id = ep.child_id
WHERE b.year = 2025;

