-- Number of student investors by certian countries (At least 2 Random Country per region)
SELECT public.people.birthplace AS country, COUNT(*) AS number_of_student_investors
FROM public.people
JOIN public.degrees ON public.people.object_id = public.degrees.object_id
WHERE public.degrees.graduated_at IS NULL
  AND public.people.birthplace IN ('Argentina', 'Australia', 'Brazil', 'Canada', 'China', 'France', 
    'Germany', 'India', 'Indonesia', 'Italy', 'Japan', 'Republic of Korea',
    'Mexico', 'Russia', 'Saudi Arabia', 'South Africa', 'Turkey',
    'United Kingdom', 'United States') 
GROUP BY public.people.birthplace
ORDER BY number_of_student_investors DESC;