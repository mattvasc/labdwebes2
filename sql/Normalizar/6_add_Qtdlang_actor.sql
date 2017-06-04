CREATE OR REPLACE FUNCTION call_fix_actor() RETURNS void AS
$$
  BEGIN
  ALTER TABLE actor ADD lang integer;
  UPDATE actor SET lang = i.numlangs FROM (SELECT act.actorid as id, COUNT(DISTINCT l.lang) as numlangs
   FROM act JOIN
        lang l
        USING (movieid)
   GROUP BY id) i WHERE actor.actorid = i.id;
   UPDATE actor SET lang = 0 WHERE lang IS NULL;
   END
   $$ LANGUAGE 'plpgsql';

DO $$
 BEGIN
  call_fix_actor();
 END;
$$
