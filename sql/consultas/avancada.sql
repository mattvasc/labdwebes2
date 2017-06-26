--Versao antiga:
SELECT movieid, title, mvyear, genre, lang FROM movie INNER JOIN genre USING(movieid) INNER JOIN lang USING (movieid)
WHERE genre.genre = 'Comédia' AND LOWER(lang.lang) LIKE 'portuguese%';


-- Versao nova:
	SELECT movieid, title, genre, actorname
	FROM (SELECT movieid, genre FROM genre WHERE genre = <parametro>) AS generos
	INNER JOIN (SELECT movieid, actorname, actorid FROM act INNER JOIN (SELECT actorname, actorid FROM actor WHERE actor.actorname = 'Adam Sandler') AS ator USING(actorid))  AS bla
	 USING (movieid) INNER JOIN movie
	USING (movieid);

--versao nova usando INTERSECT

SELECT distinct movieid, title, mvyear, genre
  FROM (SELECT movieid, genre FROM genre WHERE genre = 'Comédia') AS generos
  NATURAL JOIN (
    (SELECT movieid FROM act NATURAL JOIN (SELECT actorid FROM actor WHERE actor.actorname = 'Timothy Spall') as sub1
     INTERSECT (SELECT movieid FROM act NATURAL JOIN (SELECT actorid FROM actor WHERE actor.actorname = 'Bradley Ford') as sub2
     INTERSECT (SELECT movieid FROM act NATURAL JOIN (SELECT actorid FROM actor WHERE actor.actorname = 'Henry Castle') as sub3
   ))))AS atores_movieid
    NATURAL JOIN movie order by movieid

--versao like
SELECT * FROM select_movie_actors_in_common ('Comédia'::text, 'Timothy Spall'::text, 'Bradley Ford'::text, 'Henry Castle'::text, NULL, NULL)
