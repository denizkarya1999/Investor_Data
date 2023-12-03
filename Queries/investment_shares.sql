--  Share of all investments by investment companies -- 
SELECT affiliation_name as "Companies", SUM(raised_amount_usd) AS "Total Investment $"
FROM public.people
JOIN public.investments ON public.people.object_id = public.investments.investor_object_id
JOIN public.funding_rounds ON public.investments.funding_round_id = public.funding_rounds.funding_round_id
JOIN public.funds ON public.people.affiliation_name = public.funds.name
GROUP BY affiliation_name
ORDER BY SUM(raised_amount_usd) DESC;