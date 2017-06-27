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
SELECT distinct movieid, title, mvyear
	FROM (SELECT movieid FROM genre WHERE genre = <genero>) AS generos
	NATURAL JOIN (
		(SELECT movieid FROM act NATURAL JOIN
			(SELECT actorid FROM actor WHERE actor.actorname LIKE <actor_one> ||'%') as sub1
		INTERSECT (SELECT movieid FROM act NATURAL JOIN
			(SELECT actorid FROM actor WHERE actor.actorname LIKE <actor_two> ||'%') as sub2
		INTERSECT (SELECT movieid FROM act NATURAL JOIN
			(SELECT actorid FROM actor WHERE actor.actorname LIKE <actor_tree> ||'%') as sub3
	))))AS atores_movieid NATURAL JOIN movie order by title);
do no git status

--Exemplo de execução da procedure:
SELECT * FROM select_movie_actors_in_common ('Comédia'::text, 'Timothy Spall'::text, 'Bradley Ford'::text, 'Henry Castle'::text, NULL, NULL)
