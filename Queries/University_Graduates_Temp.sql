-- All student investors who were born in the US -- 
SELECT *
FROM public.people
JOIN public.degrees ON public.people.object_id = public.degrees.object_id
WHERE public.degrees.graduated_at IS NULL AND public.people.birthplace = 'USA';

-- All student investors who were born in UK -- 
SELECT *
FROM public.people
JOIN public.degrees ON public.people.object_id = public.degrees.object_id
WHERE public.degrees.graduated_at IS NULL AND public.people.birthplace = 'UK';

-- All student investors who were born in Germany -- 
SELECT *
FROM public.people
JOIN public.degrees ON public.people.object_id = public.degrees.object_id
WHERE public.degrees.graduated_at IS NULL AND public.people.birthplace = 'Germany';

-- All student investors who were born in Russia -- 
SELECT *
FROM public.people
JOIN public.degrees ON public.people.object_id = public.degrees.object_id
WHERE public.degrees.graduated_at IS NULL AND public.people.birthplace = 'Russia';

-- All student investors who were born in China -- 
SELECT *
FROM public.people
JOIN public.degrees ON public.people.object_id = public.degrees.object_id
WHERE public.degrees.graduated_at IS NULL AND public.people.birthplace = 'China';

-- All student investors who were born in Turkey-- 
SELECT *
FROM public.people
JOIN public.degrees ON public.people.object_id = public.degrees.object_id
WHERE public.degrees.graduated_at IS NULL AND public.people.birthplace = 'Turkey';

-- Number of student investors by country
SELECT public.people.birthplace AS country, COUNT(*) AS number_of_student_investors
FROM public.people
JOIN public.degrees ON public.people.object_id = public.degrees.object_id
WHERE public.degrees.graduated_at IS NULL
  AND public.people.birthplace IN ('USA','UK', 'France', 'Germany', 'Russia', 'China', 'Turkey', 'Saudi Arabia', 'Nigeria')
GROUP BY public.people.birthplace
ORDER BY number_of_student_investors DESC;

-- Count all University of Michigan graduates and non-graduates --
SELECT *
FROM public.people
JOIN public.degrees ON public.people.object_id = public.degrees.object_id
WHERE public.degrees.graduated_at IS NOT NULL AND public.degrees.institution = 'University of Michigan';
