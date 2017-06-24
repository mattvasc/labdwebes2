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
ALTER FUNCTION getgenres() OWNER TO aluno;




DROP FUNCTION IF EXISTS getTenMoviesByActorId(int);
CREATE OR REPLACE FUNCTION getTenMoviesByActorId(int) RETURNS TABLE (mid int, mtitle character varying (400), year character varying(100)) AS $$
BEGIN
	RETURN QUERY (SELECT movieid, title, mvyear FROM movie INNER JOIN act USING (movieid) WHERE actorid = $1 LIMIT 10);
END
$$ LANGUAGE plpgsql;
ALTER FUNCTION getTenMoviesByActorId(int) OWNER TO aluno;




DROP FUNCTION IF EXISTS getActors(int,int,int);
CREATE OR REPLACE FUNCTION getActors(int, int, int) RETURNS TABLE (actorid int, actorname text) AS $b$
BEGIN
	RETURN QUERY (SELECT actor.actorid, actor.actorname FROM actor WHERE n_lang = $1 ORDER BY actorname LIMIT $2 OFFSET $3);
END
$b$ LANGUAGE plpgsql;

-- Function: public.getactors(integer, integer, integer)

DROP FUNCTION IF EXISTS public.getactors(integer, integer, integer, integer);

CREATE OR REPLACE FUNCTION public.getactors(
    IN integer,
    IN integer,
    IN integer,
    IN integer)
  RETURNS TABLE(actorid integer, actorname text) AS
$BODY$
BEGIN
	RETURN QUERY (SELECT actor.actorid, actor.actorname, actor.n_lang FROM actor WHERE n_lang >= $1 ORDER BY n_lang DESC, actorname ASC LIMIT $2 OFFSET $3);
END
$BODY$
  LANGUAGE plpgsql VOLATILE;
  
ALTER FUNCTION public.getactors(integer, integer, integer)
  OWNER TO aluno;
ALTER FUNCTION public.getactors(integer, integer, integer, integer)
  OWNER TO aluno;

  
DROP FUNCTION IF EXISTS public.getnlang(integer, integer);

CREATE OR REPLACE FUNCTION public.getnlang(IN integer, IN integer)
  RETURNS TABLE(lang integer) AS
$BODY$
BEGIN
	RETURN QUERY (SELECT DISTINCT n_lang FROM actor WHERE n_lang >= $1 AND n_lang <= $2 ORDER BY n_lang DESC);
END
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100
  ROWS 1000;
ALTER FUNCTION public.getnlang(integer, integer)
  OWNER TO aluno;




-- Function: public.getactors(integer, integer, integer, integer)
DROP FUNCTION IF EXISTS public.getactors(integer, integer, integer, integer);
CREATE OR REPLACE FUNCTION public.getactors(
    IN integer,
    IN integer,
    IN integer,
    IN integer)
  RETURNS TABLE(actorid integer, actorname text, lang_n integer) AS
$BODY$
BEGIN
	RETURN QUERY (SELECT actor.actorid, actor.actorname, actor.n_lang FROM actor WHERE n_lang >= $1 AND n_lang <= $2 ORDER BY n_lang DESC, actorname ASC LIMIT $3 OFFSET $4);
END
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100
  ROWS 1000;
ALTER FUNCTION public.getactors(integer, integer, integer, integer)
  OWNER TO aluno;



