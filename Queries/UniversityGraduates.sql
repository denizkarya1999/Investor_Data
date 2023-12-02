SELECT historical_event, count
FROM (
    SELECT 'Graduated in 2000s' AS historical_event, COUNT(*) AS count
    FROM public.degrees
    WHERE public.degrees.graduated_at > '2000-01-01'
    UNION ALL
    SELECT 'Graduated in 1990s' AS historical_event, COUNT(*) AS count
    FROM public.degrees
    WHERE public.degrees.graduated_at > '1990-01-01' AND public.degrees.graduated_at <= '2000-01-01'
    UNION ALL
    SELECT 'Graduated in 1980s' AS historical_event, COUNT(*) AS count
    FROM public.degrees
    WHERE public.degrees.graduated_at > '1980-01-01' AND public.degrees.graduated_at <= '1990-01-01'
    UNION ALL
    SELECT 'Graduated in 1970s' AS historical_event, COUNT(*) AS count
    FROM public.degrees
    WHERE public.degrees.graduated_at > '1970-01-01' AND public.degrees.graduated_at <= '1980-01-01'
	UNION ALL
	SELECT 'Graduated in 1960s' AS historical_event, COUNT(*) AS count
    FROM public.degrees
    WHERE public.degrees.graduated_at > '1960-01-01' AND public.degrees.graduated_at <= '1970-01-01'
    UNION ALL
    SELECT 'Graduated in 1950s' AS historical_event, COUNT(*) AS count
    FROM public.degrees
    WHERE public.degrees.graduated_at > '1950-01-01' AND public.degrees.graduated_at <= '1960-01-01'
)
ORDER BY count ASC;