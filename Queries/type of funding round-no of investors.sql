ALTER TABLE funding_rounds
ADD COLUMN participants_greater_than_1 BOOLEAN;

UPDATE funding_rounds
SET participants_greater_than_1 = 
    CASE WHEN (SELECT participants FROM funding_rounds WHERE participants > 1) 
         THEN TRUE 
         ELSE FALSE 
    END;

select
 	round(count(participants_greater_than_1) / sum(count(participants_greater_than_1)) over(partition by funding_round_type), 2) as freq,
 participants_greater_than_1,
 funding_round_type
from funding_rounds join investments on funding_rounds.funding_round_id=investments.funding_round_id
group by participants_greater_than_1, funding_round_type
order by funding_round_type,participants_greater_than_1 DESC; 

SELECT
    funding_round_type,
    AVG(participants) AS avg_participants,
    COUNT(*) AS num_rounds
FROM
    funding_rounds
GROUP BY
    funding_round_type;
