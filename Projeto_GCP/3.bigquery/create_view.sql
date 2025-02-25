CREATE OR REPLACE VIEW `lustrous-spirit-451917-p2.teste_tecnico.crypto_market_view` AS
SELECT 
    id,
    name,
    symbol,
    rank,
    ROUND(priceUsd, 8) AS priceUsd,
    ROUND(marketCapUsd, 2) AS marketCapUsd,
    ROUND(volumeUsd24Hr, 2) AS volumeUsd24Hr,
    supply,
    COALESCE(maxSupply, 0) AS maxSupply,
    EXTRACT(YEAR FROM TIMESTAMP '2025-02-25 13:46:40.287889 UTC') AS year,
    EXTRACT(MONTH FROM TIMESTAMP '2025-02-25 13:46:40.287889 UTC') AS month,
    EXTRACT(DAY FROM TIMESTAMP '2025-02-25 13:46:40.287889 UTC') AS day,
    FORMAT_TIMESTAMP('%H:%M:%S', TIMESTAMP '2025-02-25 13:46:40.287889 UTC') AS time_formatted,
    CASE 
        WHEN marketCapUsd >= 100000000000 THEN 'Mega Cap'
        WHEN marketCapUsd >= 10000000000 THEN 'Large Cap'
        WHEN marketCapUsd >= 1000000000 THEN 'Mid Cap'
        WHEN marketCapUsd >= 100000000 THEN 'Small Cap'
        ELSE 'Micro Cap'
    END AS market_cap_category,

FROM `lustrous-spirit-451917-p2.teste_tecnico.cryptocurrency` c
JOIN `lustrous-spirit-451917-p2.teste_tecnico.market_data` m
USING(id);
