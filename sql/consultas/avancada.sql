SELECT movieid, title, mvyear, genre, lang FROM movie INNER JOIN genre USING(movieid) INNER JOIN lang USING (movieid)
WHERE genre.genre = 'Comedy' AND LOWER(lang.lang) LIKE 'portuguese%';

