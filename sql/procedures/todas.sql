CREATE INDEX actor_index_nlang
  ON public.actor
  USING btree
  (n_lang)
  WITH (FILLFACTOR=100);






DROP FUNCTION IF EXISTS public.getgenres();

CREATE OR REPLACE FUNCTION public.getgenres()
  RETURNS SETOF character varying AS
$BODY$
     SELECT DISTINCT genre FROM genre ORDER BY genre;
$BODY$
  LANGUAGE sql VOLATILE
  COST 100
  ROWS 1000;





DROP FUNCTION IF EXISTS getNLang(int);
CREATE OR REPLACE FUNCTION getNLang(int) RETURNS TABLE (lang int) AS $$
BEGIN
	RETURN QUERY (SELECT DISTINCT n_lang FROM actor WHERE n_lang >= $1 ORDER BY n_lang DESC);
END
$$ LANGUAGE plpgsql;






DROP FUNCTION IF EXISTS getActors(int,int,int);
CREATE OR REPLACE FUNCTION getActors(int, int, int) RETURNS TABLE (actorid int, actorname text) AS $b$
BEGIN
	RETURN QUERY (SELECT actor.actorid, actor.actorname FROM actor WHERE n_lang = $1 ORDER BY actorname LIMIT $2 OFFSET $3);
END
$b$ LANGUAGE plpgsql;

