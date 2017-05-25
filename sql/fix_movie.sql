-- Funcao que arruma
CREATE OR REPLACE FUNCTION fix_movies(movieid integer, title character varying(400), mvyear character varying(100)) RETURNS void AS
$$
BEGIN
    INSERT INTO movies_slice (movieid, title, mvyear) VALUES (movieid, title, mvyear);
END
$$ LANGUAGE 'plpgsql';



-- Funcao pra chamar a funcao que arurma
CREATE OR REPLACE FUNCTION  call_fix_movies() RETURNS void AS
$$
BEGIN

    ALTER TABLE movies_slice RENAME TO movies_slice_old;
    CREATE TABLE movies_slice(movieid integer, title character varying(400), mvyear character varying(100));
    PERFORM fix_movies( movieid,title, mvyear ) FROM (SELECT DISTINCT t.movieid, t.title, t.mvyear FROM movies_slice_old AS t) AS s; -- is ok
    DROP TABLE movies_slice_old;

END
$$ LANGUAGE 'plpgsql';

-- Normatizando Campos
DO $$
  BEGIN
    PERFORM  call_fix_movies();
END;
$$;
