-- People who are employed
SELECT object_id, first_name, last_name, birthplace, title, affiliation_name, start_at
FROM public.people
NATURAL JOIN public.relationships
WHERE public.relationships.is_past <> 1
ORDER BY public.people.id ASC;

-- Count Number of people who are employed
SELECT COUNT(*) AS number_of_employed_people
FROM public.people
NATURAL JOIN public.relationships
WHERE public.relationships.is_past <> 1;

-- Count Number of people who are unemployed
SELECT COUNT(*) AS number_of_unemployed_people
FROM public.people
NATURAL JOIN public.relationships
WHERE public.relationships.is_past <> 0;

-- Combination of all (Employed, Unemployed and Total)
SELECT 'Employed' AS employment_status, COUNT(*) AS count
FROM public.people
NATURAL JOIN public.relationships
WHERE public.relationships.is_past <> 1
UNION ALL
SELECT 'Unemployed' AS employment_status, COUNT(*) AS count
FROM public.people
NATURAL JOIN public.relationships
WHERE public.relationships.is_past <> 0
UNION ALL
SELECT 'Total' AS employment_status, COUNT(*) AS count
FROM public.people
ORDER BY count DESC;