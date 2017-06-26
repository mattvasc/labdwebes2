DROP FUNCTION IF EXISTS public.select_movie_actors_in_common(text, text, text, text, text, text);

CREATE OR REPLACE FUNCTION public.select_movie_actors_in_common(
    IN genero text,
    IN actor_one text,
    IN actor_two text,
    IN actor_tree text,
    IN actor_four text,
    IN actor_five text)
  RETURNS TABLE(mid integer, mtitle character varying, year character varying) AS
$BODY$

BEGIN
	IF actor_two IS NULL THEN
			RETURN QUERY (SELECT distinct movieid, title, mvyear
		  FROM (SELECT movieid FROM genre WHERE genre.genre = genero) AS generos
		  NATURAL JOIN (
		    (SELECT movieid FROM act NATURAL JOIN (SELECT actorid FROM actor WHERE actor.actorname LIKE actor_one ||'%') as sub1
			))AS atores_movieid NATURAL JOIN movie order by title);

		ELSIF actor_tree IS NULL THEN
			RETURN QUERY(SELECT distinct movieid, title, mvyear
			  FROM (SELECT movieid FROM genre WHERE genre = genero) AS generos
			  NATURAL JOIN (
			    (SELECT movieid FROM act NATURAL JOIN (SELECT actorid FROM actor WHERE actor.actorname LIKE actor_one ||'%') as sub1
					INTERSECT (SELECT movieid FROM act NATURAL JOIN (SELECT actorid FROM actor WHERE actor.actorname LIKE actor_two ||'%') as sub2
				)))AS atores_movieid NATURAL JOIN movie order by title);

		ELSIF actor_four IS NULL THEN
			RETURN QUERY (SELECT distinct movieid, title, mvyear
				FROM (SELECT movieid FROM genre WHERE genre = genero) AS generos
				NATURAL JOIN (
					(SELECT movieid FROM act NATURAL JOIN (SELECT actorid FROM actor WHERE actor.actorname LIKE actor_one ||'%') as sub1
					INTERSECT (SELECT movieid FROM act NATURAL JOIN (SELECT actorid FROM actor WHERE actor.actorname LIKE actor_two ||'%') as sub2
					INTERSECT (SELECT movieid FROM act NATURAL JOIN (SELECT actorid FROM actor WHERE actor.actorname LIKE actor_tree ||'%') as sub3
				))))AS atores_movieid NATURAL JOIN movie order by title);

		ELSIF actor_five IS NULL THEN
			RETURN QUERY (SELECT distinct movieid, title, mvyear
				FROM (SELECT movieid FROM genre WHERE genre = genero) AS generos
				NATURAL JOIN (
					(SELECT movieid FROM act NATURAL JOIN (SELECT actorid FROM actor WHERE actor.actorname LIKE actor_one ||'%') as sub1
					INTERSECT (SELECT movieid FROM act NATURAL JOIN (SELECT actorid FROM actor WHERE actor.actorname LIKE actor_two ||'%') as sub2
					INTERSECT (SELECT movieid FROM act NATURAL JOIN (SELECT actorid FROM actor WHERE actor.actorname LIKE actor_tree ||'%') as sub3
					INTERSECT (SELECT movieid FROM act NATURAL JOIN (SELECT actorid FROM actor WHERE actor.actorname LIKE actor_four ||'%') as sub4
				)))))AS atores_movieid NATURAL JOIN movie order by title);
		ELSE
			RETURN QUERY (SELECT distinct movieid, title, mvyear 
				FROM (SELECT movieid FROM genre WHERE genre = genero) AS generos
				NATURAL JOIN (
					(SELECT movieid FROM act NATURAL JOIN (SELECT actorid FROM actor WHERE actor.actorname LIKE actor_one ||'%') as sub1
					INTERSECT (SELECT movieid FROM act NATURAL JOIN (SELECT actorid FROM actor WHERE actor.actorname LIKE actor_two ||'%') as sub2
					INTERSECT (SELECT movieid FROM act NATURAL JOIN (SELECT actorid FROM actor WHERE actor.actorname LIKE actor_tree ||'%') as sub3
					INTERSECT (SELECT movieid FROM act NATURAL JOIN (SELECT actorid FROM actor WHERE actor.actorname LIKE actor_four ||'%') as sub4
					INTERSECT (SELECT movieid FROM act NATURAL JOIN (SELECT actorid FROM actor WHERE actor.actorname LIKE actor_five ||'%') as sub5
				))))))AS atores_movieid NATURAL JOIN movie order by title);

		END IF;
END
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100
  ROWS 1000;
ALTER FUNCTION public.select_movie_actors_in_common(text, text, text, text, text, text)
  OWNER TO aluno;



DROP FUNCTION IF EXISTS additional_fields(INTEGER);
CREATE OR REPLACE FUNCTION additional_fields(INTEGER)
RETURNS TABLE (actornames TEXT[], dnames character varying(500)[] , langs varchar[], genres varchar[]) AS
$BODY$
BEGIN

RETURN QUERY (SELECT ARRAY(SELECT actorname FROM (SELECT DISTINCT actorname, n_lang FROM act NATURAL JOIN actor WHERE movieid = $1 ORDER BY n_lang DESC LIMIT 20) as B), ARRAY(SELECT dname FROM director NATURAL JOIN director_movie WHERE movieid = $1 ORDER BY dname), ARRAY(SELECT lang FROM lang WHERE movieid = $1), ARRAY(SELECT genre FROM genre WHERE movieid = $1 order by genre));


END
$BODY$
  LANGUAGE plpgsql VOLATILE;
 ALTER FUNCTION additional_fields(INTEGER)  OWNER TO aluno;

 select * from additional_fields(1480499)
