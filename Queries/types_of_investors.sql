SELECT Institution
FROM public.people
JOIN public.degrees ON public.people.object_id = public.degrees.object_id
JOIN public.investments ON public.people.object_id = public.investments.investor_object_id
JOIN public.funding_rounds ON public.investments.funding_round_id = public.funding_rounds.funding_round_id
JOIN public.funds ON public.people.affiliation_name = public.funds.name
WHERE public.degrees.graduated_at IS NOT NULL AND public.people.affiliation_name <> 'Unaffiliated'
GROUP BY Institution;