SELECT 
  CASE 
    WHEN public.people.birthplace IN (
      'Alabama', 'Alaska', 'Arizona', 'Arkansas', 'California', 'Colorado', 'Connecticut', 
      'Delaware', 'Florida', 'Georgia', 'Hawaii', 'Idaho', 'Illinois', 'Indiana', 'Iowa', 
      'Kansas', 'Kentucky', 'Louisiana', 'Maine', 'Maryland', 'Massachusetts', 'Michigan', 
      'Minnesota', 'Mississippi', 'Missouri', 'Montana', 'Nebraska', 'Nevada', 'New Hampshire', 
      'New Jersey', 'New Mexico', 'New York', 'North Carolina', 'North Dakota', 'Ohio', 'Oklahoma', 
      'Oregon', 'Pennsylvania', 'Rhode Island', 'South Carolina', 'South Dakota', 'Tennessee', 
      'Texas', 'Utah', 'Vermont', 'Virginia', 'Washington', 'West Virginia', 'Wisconsin', 'Wyoming'
    )
    THEN 'United States'
    ELSE public.people.birthplace
  END AS country,
  COUNT(*) AS number_of_student_investors
FROM public.people
JOIN public.degrees ON public.people.object_id = public.degrees.object_id
JOIN public.objects ON public.people.object_id = public.objects.id
WHERE public.degrees.graduated_at IS NOT NULL 
  AND public.people.birthplace IN (
    'Alabama', 'Alaska', 'Arizona', 'Arkansas', 'California', 'Colorado', 'Connecticut', 
    'Delaware', 'Florida', 'Georgia', 'Hawaii', 'Idaho', 'Illinois', 'Indiana', 'Iowa', 
    'Kansas', 'Kentucky', 'Louisiana', 'Maine', 'Maryland', 'Massachusetts', 'Michigan', 
    'Minnesota', 'Mississippi', 'Missouri', 'Montana', 'Nebraska', 'Nevada', 'New Hampshire', 
    'New Jersey', 'New Mexico', 'New York', 'North Carolina', 'North Dakota', 'Ohio', 'Oklahoma', 
    'Oregon', 'Pennsylvania', 'Rhode Island', 'South Carolina', 'South Dakota', 'Tennessee', 
    'Texas', 'Utah', 'Vermont', 'Virginia', 'Washington', 'West Virginia', 'Wisconsin', 'Wyoming', 
    'Argentina', 'Australia', 'Brazil', 'Canada', 'China', 'France', 
    'Germany', 'India', 'Indonesia', 'Italy', 'Japan', 'Republic of Korea',
    'Mexico', 'Russia', 'Saudi Arabia', 'South Africa', 'Turkey',
    'United Kingdom'
  )
GROUP BY country
ORDER BY number_of_student_investors DESC;