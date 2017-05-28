SELECT a.actorname, m.title, m.mvyear, act.as_character, l.lang 
FROM actor a JOIN
     act
     USING (actorid) JOIN
     movies_slice m
     USING (movieid) JOIN
     lang l
     USING (movieid) JOIN
     (SELECT act.actorid, COUNT(DISTINCT l.lang) as numlangs
      FROM act JOIN
           lang l
           USING (movieid)
      GROUP BY act.actorid
      HAVING COUNT(DISTINCT l.lang) > 1
     ) al
     USING (actorid)
ORDER BY al.numlangs DESC;
