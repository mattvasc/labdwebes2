CREATE OR REPLACE FUNCTION select_movie_actors_in_common(genero TEXT, actor_one TEXT, actor_two TEXT, actor_tree TEXT, actor_four TEXT, actor_five TEXT)
RETURNS TABLE (mid int, mtitle character varying (400), year character varying (100), mgenre character varying (100)) AS

$BODY$

BEGIN
	IF actor_two IS NULL THEN
			RETURN QUERY (SELECT distinct movieid, title, mvyear, genre
		  FROM (SELECT movieid, genre.genre FROM genre WHERE genre.genre = genero) AS generos
		  NATURAL JOIN (
		    (SELECT movieid FROM act NATURAL JOIN (SELECT actorid FROM actor WHERE actor.actorname = actor_one) as sub1
			))AS atores_movieid NATURAL JOIN movie order by title);

		ELSIF actor_tree IS NULL THEN
			RETURN QUERY(SELECT distinct movieid, title, mvyear, genre
			  FROM (SELECT movieid, genre FROM genre WHERE genre = genre) AS generos
			  NATURAL JOIN (
			    (SELECT movieid FROM act NATURAL JOIN (SELECT actorid FROM actor WHERE actor.actorname = actor_one) as sub1
					INTERSECT (SELECT movieid FROM act NATURAL JOIN (SELECT actorid FROM actor WHERE actor.actorname = actor_two) as sub2
				)))AS atores_movieid NATURAL JOIN movie order by title);

		ELSIF actor_four IS NULL THEN
			RETURN QUERY (SELECT distinct movieid, title, mvyear, genre
				FROM (SELECT movieid, genre FROM genre WHERE genre = genre) AS generos
				NATURAL JOIN (
					(SELECT movieid FROM act NATURAL JOIN (SELECT actorid FROM actor WHERE actor.actorname = actor_one) as sub1
					INTERSECT (SELECT movieid FROM act NATURAL JOIN (SELECT actorid FROM actor WHERE actor.actorname = actor_two) as sub2
					INTERSECT (SELECT movieid FROM act NATURAL JOIN (SELECT actorid FROM actor WHERE actor.actorname = actor_tree) as sub3
				))))AS atores_movieid NATURAL JOIN movie order by title);

		ELSIF actor_five IS NULL THEN
			RETURN QUERY (SELECT distinct movieid, title, mvyear, genre
				FROM (SELECT movieid, genre FROM genre WHERE genre = genre) AS generos
				NATURAL JOIN (
					(SELECT movieid FROM act NATURAL JOIN (SELECT actorid FROM actor WHERE actor.actorname = actor_one) as sub1
					INTERSECT (SELECT movieid FROM act NATURAL JOIN (SELECT actorid FROM actor WHERE actor.actorname = actor_two) as sub2
					INTERSECT (SELECT movieid FROM act NATURAL JOIN (SELECT actorid FROM actor WHERE actor.actorname = actor_tree) as sub3
					INTERSECT (SELECT movieid FROM act NATURAL JOIN (SELECT actorid FROM actor WHERE actor.actorname = actor_four) as sub4
				)))))AS atores_movieid NATURAL JOIN movie order by title);
		ELSE
			RETURN QUERY (SELECT distinct movieid, title, mvyear, genre
				FROM (SELECT movieid, genre FROM genre WHERE genre = genre) AS generos
				NATURAL JOIN (
					(SELECT movieid FROM act NATURAL JOIN (SELECT actorid FROM actor WHERE actor.actorname = actor_one) as sub1
					INTERSECT (SELECT movieid FROM act NATURAL JOIN (SELECT actorid FROM actor WHERE actor.actorname = actor_two) as sub2
					INTERSECT (SELECT movieid FROM act NATURAL JOIN (SELECT actorid FROM actor WHERE actor.actorname = actor_tree) as sub3
					INTERSECT (SELECT movieid FROM act NATURAL JOIN (SELECT actorid FROM actor WHERE actor.actorname = actor_four) as sub4
					INTERSECT (SELECT movieid FROM act NATURAL JOIN (SELECT actorid FROM actor WHERE actor.actorname = actor_five) as sub5
				))))))AS atores_movieid NATURAL JOIN movie order by title);

		END IF;
END
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100
  ROWS 1000;

ALTER FUNCTION public.select_movie_actors_in_common(genre TEXT, actor_one TEXT, actor_two TEXT, actor_tree TEXT, actor_four TEXT, actor_five TEXT)

  OWNER TO postgres;
