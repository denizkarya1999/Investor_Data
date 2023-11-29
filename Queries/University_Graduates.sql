-- All university graduates and non-graduates --
SELECT *
FROM public.people
JOIN public.degrees ON public.people.object_id = public.degrees.object_id
WHERE public.degrees.graduated_at IS NOT NULL
