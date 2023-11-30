-- 
SELECT 'Economic Crisis (2008) - End of Data (12-31-2012)' AS historical_event, COUNT(*) AS count
FROM public.people
JOIN public.degrees ON public.people.object_id = public.degrees.object_id
JOIN public.objects ON public.people.object_id = public.objects.id
WHERE public.degrees.graduated_at > '11-1-2008' AND public.degrees.graduated_at <= '12-31-2012' AND
public.degrees.subject = 'Computer Science'
UNION ALL
SELECT '.COM Bubble (2000) - Economic Crisis (2008)' AS historical_event, COUNT(*) AS count
FROM public.people
JOIN public.degrees ON public.people.object_id = public.degrees.object_id
JOIN public.objects ON public.people.object_id = public.objects.id
WHERE public.degrees.graduated_at > '04-01-2000' AND public.degrees.graduated_at <= '11-01-2008' AND
public.degrees.subject = 'Computer Science'
UNION ALL
SELECT 'Invention of PC (1981) - .COM Bubble (2000)' AS historical_event, COUNT(*) AS count
FROM public.people
JOIN public.degrees ON public.people.object_id = public.degrees.object_id
JOIN public.objects ON public.people.object_id = public.objects.id
WHERE public.degrees.graduated_at > '08-12-1981' AND public.degrees.graduated_at <= '04-01-2000' AND
public.degrees.subject = 'Computer Science'
UNION ALL
SELECT 'Invention of First Computer (1946)' AS historical_event, COUNT(*) AS count
FROM public.people
JOIN public.degrees ON public.people.object_id = public.degrees.object_id
JOIN public.objects ON public.people.object_id = public.objects.id
WHERE public.degrees.graduated_at > '02-14-1946' AND public.degrees.graduated_at <= '08-12-1981' AND
public.degrees.subject = 'Computer Science';