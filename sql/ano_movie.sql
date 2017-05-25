

--Removendo ?????
UPDATE movies_slice SET mvyear = NULL WHERE mvyear = '????' OR mvyear =  '\''';
-- Arrumando anomalias
SELECT substring( unnest(regexp_matches(title, '\([0-9]{4}\)')) from 2 for 4 )
  FROM public.movies_slice;
