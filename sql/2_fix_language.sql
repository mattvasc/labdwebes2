CREATE OR REPLACE FUNCTION fix_lang(movieid integer, languages varchar(1000)) RETURNS void AS
$$
BEGIN
    INSERT INTO lang (movieid, lang) VALUES (movieid, TRIM(UNNEST(STRING_TO_ARRAY(languages, ';'))));
END
$$ LANGUAGE 'plpgsql';

CREATE OR REPLACE FUNCTION call_fix_lang() RETURNS void AS
  $$
	BEGIN
		DROP TABLE IF EXISTS lang;
		CREATE TABLE lang(movieid integer, lang varchar(100) );
		PERFORM fix_lang( movieid, languages ) FROM (SELECT DISTINCT t.movieid, t.languages FROM movies_slice AS t) AS s; 
		ALTER TABLE movies_slice DROP COLUMN languages;
		ALTER TABLE lang ADD PRIMARY KEY(movieid, lang);
  END
$$ LANGUAGE 'plpgsql';

-- Normatizando Campos
DO $$
  BEGIN
    PERFORM call_fix_lang();
END;
$$;
