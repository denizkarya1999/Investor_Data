-- How many people are angel investors, series investors and venture capital and where are they from?
SELECT 'Angel Investor' AS investor_type, COUNT(*) AS count
FROM public.people
JOIN public.investments ON public.people.object_id = public.investments.investor_object_id
JOIN public.funding_rounds ON public.investments.funding_round_id = public.funding_rounds.funding_round_id
JOIN public.funds ON public.people.affiliation_name = public.funds.name
WHERE funding_round_type ILIKE 'a%'
UNION ALL
SELECT 'Series Investor' AS investor_type, COUNT(*) AS count
FROM public.people
JOIN public.investments ON public.people.object_id = public.investments.investor_object_id
JOIN public.funding_rounds ON public.investments.funding_round_id = public.funding_rounds.funding_round_id
JOIN public.funds ON public.people.affiliation_name = public.funds.name
WHERE funding_round_type ILIKE 's%'
UNION ALL
SELECT 'Venture Capital' AS investor_type, COUNT(*) AS count
FROM public.people
JOIN public.investments ON public.people.object_id = public.investments.investor_object_id
JOIN public.funding_rounds ON public.investments.funding_round_id = public.funding_rounds.funding_round_id
JOIN public.funds ON public.people.affiliation_name = public.funds.name
WHERE funding_round_type ILIKE 'v%';