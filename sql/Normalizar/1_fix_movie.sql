-- Funcao que arruma
CREATE OR REPLACE FUNCTION fix_database(movieid integer, title character varying(400), mvyear character varying(100), actorid integer, actorname character varying(250), sex character (1), as_character character varying(250), languages character varying(1000), genres varchar(100)) RETURNS void AS
$$
	BEGIN
    INSERT INTO genre (movieid, genre) VALUES (movieid, TRIM(UNNEST(STRING_TO_ARRAY(genres, ';')))) ON CONFLICT DO NOTHING;
		INSERT INTO lang (movieid, lang) VALUES (movieid, TRIM(UNNEST(STRING_TO_ARRAY(languages, ';')))) ON CONFLICT DO NOTHING;
		INSERT INTO actor (actorid, actorname) VALUES (actorid, actorname) ON CONFLICT DO NOTHING;
    INSERT INTO act (movieid, actorid, as_character, sex) VALUES (movieid, actorid, as_character, sex) ON CONFLICT DO NOTHING;
	END
$$ LANGUAGE 'plpgsql';



-- Funcao pra chamar a funcao que arurma
CREATE OR REPLACE FUNCTION  call_fix_database() RETURNS void AS
$$
	BEGIN
		DROP TABLE IF EXISTS lang;
		DROP TABLE IF EXISTS genre;
		DROP TABLE IF EXISTS act;
		DROP TABLE IF EXISTS actor;
		

		CREATE TABLE lang(movieid integer, lang varchar(100) );
		CREATE TABLE genre(movieid integer, genre varchar(100));
		CREATE TABLE actor(actorid integer, actorname text);
		CREATE TABLE act(movieid integer,actorid integer,as_character text,sex character (1));

		ALTER TABLE lang ADD PRIMARY KEY(movieid, lang);
		ALTER TABLE genre ADD PRIMARY KEY(movieid, genre);
		ALTER TABLE act ADD PRIMARY KEY(movieid, actorid, as_character);
		ALTER TABLE actor ADD PRIMARY KEY (actorid);

		PERFORM fix_database( movieid, title, mvyear, actorid, actorname, sex, as_character, languages, genres ) FROM (SELECT * FROM movies) AS s; -- is ok

		ALTER TABLE movies DROP COLUMN genres;
		ALTER TABLE movies DROP COLUMN languages;
		ALTER TABLE movies DROP COLUMN actorname, DROP COLUMN actorid, DROP COLUMN sex, DROP COLUMN as_character;


		-- Removendo duplicatas:
		DELETE FROM movies WHERE EXISTS
		(SELECT 1 FROM movies t2
			WHERE t2.movieid = movies.movieid AND
			t2.title = movies.title AND
			t2.mvyear = movies.mvyear AND
			t2.ctid > movies.ctid
		);

		-- Arrumando anomalias no ano
		UPDATE movies SET mvyear = substring( unnest(regexp_matches(title, '\([0-9]{4}')) from 2 for 4 ) WHERE mvyear IS NULL OR TRIM(mvyear) =  '' OR mvyear = '????' OR mvyear like '%''%';

		-- E por fim:
		ALTER TABLE movies RENAME TO movie;



	END
$$ LANGUAGE 'plpgsql';


-- Normatizando Campos
DO $$
  BEGIN
    PERFORM  call_fix_database();
	END;
$$;
