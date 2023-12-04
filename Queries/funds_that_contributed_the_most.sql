-- Select funds that contributed the most --
SELECT affiliation_name ,Sum(raised_amount) as investment
FROM public.people
JOIN public.funds ON public.people.affiliation_name = public.funds.name
WHERE raised_amount > 0 AND funded_at > '1-1-2010'
GROUP BY affiliation_name
ORDER BY investment DESC;