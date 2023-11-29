-- Count the number of university graduates and non-graduates --
SELECT 'University Graduates' AS University_Graduates, COUNT(*) AS count
FROM public.people
JOIN public.degrees ON public.people.object_id = public.degrees.object_id
WHERE public.degrees.graduated_at IS NOT NULL
UNION ALL
SELECT 'Non-University Graduates' AS University_Non_Graduates, COUNT(*) AS count 
FROM public.people
JOIN public.degrees ON public.people.object_id = public.degrees.object_id
WHERE public.degrees.graduated_at IS NULL AND (public.degrees.degree_type = 'BS' OR public.degrees.degree_type = 'BA');