-- Funcao que arruma
CREATE OR REPLACE FUNCTION fix_genre(movieid integer, genres varchar(100)) RETURNS void AS
$$
BEGIN
    INSERT INTO genre (movieid, genre) VALUES (movieid, TRIM(UNNEST(STRING_TO_ARRAY(genres, ';'))));
END
$$ LANGUAGE 'plpgsql';



-- Funcao pra chamar a funcao que arurma
CREATE OR REPLACE FUNCTION  call_fix_genre() RETURNS void AS
$$
BEGIN
    PERFORM fix_genre( movieid, genres ) FROM (SELECT DISTINCT t.movieid, t.genres FROM movies_slice AS t) AS s; -- is ok
    ALTER TABLE movies_slice DROP COLUMN genres;

END
$$ LANGUAGE 'plpgsql';


-- Normatizando Campos
DO $$
  BEGIN
    PERFORM  call_fix_genre();
END;
$$;
