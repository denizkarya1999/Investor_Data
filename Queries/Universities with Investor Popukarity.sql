SELECT public.degrees.institution,public.degrees.subject, COUNT(public.degrees.subject) AS subject_count
FROM public.people
JOIN public.degrees ON public.people.object_id = public.degrees.object_id
WHERE public.degrees.graduated_at IS NOT NULL 
GROUP BY public.degrees.institution, public.degrees.subject
ORDER BY subject_count DESC
LIMIT 22;