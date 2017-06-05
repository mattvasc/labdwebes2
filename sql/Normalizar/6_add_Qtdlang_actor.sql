
  UPDATE actor SET n_lang = i.numlangs FROM (SELECT act.actorid as id, COUNT(DISTINCT l.lang) as numlangs
   FROM act JOIN
        lang l
        USING (movieid)
   GROUP BY id) i WHERE actor.actorid = i.id;
   UPDATE actor SET n_lang = 0 WHERE n_lang IS NULL;

