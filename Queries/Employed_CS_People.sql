-- Count all Computer Science people who have at least bachelor`s degree and working in a company--
SELECT 'Employed Computer Science Students' AS employment_status, COUNT(*) AS count
FROM public.people
JOIN public.degrees ON public.people.object_id = public.degrees.object_id
JOIN public.objects ON public.people.object_id = public.objects.id
WHERE public.degrees.graduated_at IS NOT NULL AND 
public.degrees.subject = 'Computer Science' AND
public.people.affiliation_name <> 'Unaffiliated'
AND public.degrees.degree_type IS NOT NULL
AND public.objects.status = 'operating'
UNION ALL
SELECT 'Unemployed Computer Science Students' AS employment_status, COUNT(*) AS count
FROM public.people
JOIN public.degrees ON public.people.object_id = public.degrees.object_id
JOIN public.objects ON public.people.object_id = public.objects.id
WHERE public.degrees.graduated_at IS NOT NULL AND 
public.degrees.subject = 'Computer Science' AND
public.people.affiliation_name = 'Unaffiliated'
UNION ALL
SELECT 'Total Computer Science Students' AS employment_status, COUNT(*) AS count
FROM public.people
JOIN public.degrees ON public.people.object_id = public.degrees.object_id
JOIN public.objects ON public.people.object_id = public.objects.id
WHERE public.degrees.graduated_at IS NOT NULL AND 
public.degrees.subject = 'Computer Science'