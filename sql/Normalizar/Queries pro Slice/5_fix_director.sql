-- Funcao que insere numa nova tabela de diretor com nome referente ao id
CREATE OR REPLACE FUNCTION fix_director(directorid integer, dname character varying(50000), addition character varying(1000), movieid integer) RETURNS void AS
$$
BEGIN
    INSERT INTO director(directorid, dname, addition) VALUES (directorid, dname, addition) ON CONFLICT DO NOTHING;
    INSERT INTO director_movie (movieid, directorid) VALUES (movieid, directorid) ON CONFLICT DO NOTHING;
END
$$ LANGUAGE 'plpgsql';	



-- Funcao pra chamar as funcoes que normalizam
CREATE OR REPLACE FUNCTION  call_fix_director() RETURNS void AS
$$
BEGIN
    --renomeando a para tabela aual e criando uma nova com o nome antigo
    CREATE TABLE director_movie(movieid integer, directorid integer);
    ALTER TABLE director_movie ADD PRIMARY KEY (movieid, directorid);
    --criacao de uma nova tabela com id, nome do diretor e infos fulas
    CREATE TABLE director (directorid integer, dname character varying(500), addition character varying(1000));
    ALTER TABLE director ADD PRIMARY KEY(directorid);
    PERFORM fix_director(directorid, dname, addition, movieid) FROM (SELECT DISTINCT t.directorid, t.dname, t.addition, t.movieid FROM directorsmovies_slice AS t) AS s;
    DROP TABLE directorsmovies_slice;

END
$$ LANGUAGE 'plpgsql';

-- Normatizando Campos
DO $$
  BEGIN
    PERFORM  call_fix_director();
END;
$$;
