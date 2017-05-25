CREATE OR REPLACE FUNCTION fix_language(movieid integer, languages varchar(1000)) RETURNS void AS
$$
BEGIN
    INSERT INTO language (movieid, language) VALUES (movieid, TRIM(UNNEST(STRING_TO_ARRAY(languages, ';'))));
END
$$ LANGUAGE 'plpgsql';

CREATE OR REPLACE FUNCTION call_fix_language() RETURNS void AS
  $$
  BEGIN
      PERFORM fix_language( movieid, languages ) FROM (SELECT DISTINCT t.movieid, t.languages FROM movies_slice AS t) AS s; -- is ok
      ALTER TABLE movies_slice DROP COLUMN languages;
  END
$$ LANGUAGE 'plpgsql';

-- Normatizando Campos
DO $$
  BEGIN
    PERFORM call_fix_language();
END;
$$;
