--Versao antiga:
SELECT movieid, title, mvyear, genre, lang FROM movie INNER JOIN genre USING(movieid) INNER JOIN lang USING (movieid)
WHERE genre.genre = 'Comédia' AND LOWER(lang.lang) LIKE 'portuguese%';


-- Versao nova:
SELECT movieid, title, genre, actorname 
FROM (SELECT movieid, genre FROM genre WHERE genre = 'Comédia') AS generos
INNER JOIN (SELECT movieid, actorname, actorid FROM act INNER JOIN (SELECT actorname, actorid FROM actor WHERE actor.actorname = 'Adam Sandler') AS ator USING(actorid))  AS bla
 USING (movieid) INNER JOIN movie 
USING (movieid);
