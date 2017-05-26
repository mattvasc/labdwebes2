

--Removendo ????? se der errado, teste com '\'''
--UPDATE movies_slice SET mvyear = NULL WHERE mvyear = '????' OR mvyear =  

UPDATE movies_slice SET mvyear = NULL WHERE mvyear = '????' OR mvyear like '%''%';
-- Arrumando anomalias
--SELECT substring( unnest(regexp_matches(title, '\([0-9]{4}')) from 2 for 4 )
  --FROM public.movies_slice;


UPDATE movies_slice SET mvyear = substring( unnest(regexp_matches(title, '\([0-9]{4}')) from 2 for 4 ) WHERE mvyear IS NULL OR TRIM(mvyear) =  '';
