-- Funcao que insere numa nova tabela de diretor com nome referente ao id
CREATE OR REPLACE FUNCTION fix_director(directorid integer, dname character varying(50000), addition character varying(1000)) RETURNS void AS
$$
BEGIN
    INSERT INTO director_dname (directorid, dname, addition) VALUES (directorid, dname, addition) ON CONFLICT DO NOTHING;
END
$$ LANGUAGE 'plpgsql';

-- funcao que insere na relacao de movieid com directorid, sendo que os dois sao pk
CREATE OR REPLACE FUNCTION fix_director_movie(movieid integer, directorid integer) RETURNS void AS
$$
BEGIN
    INSERT INTO directorsmovies_slice (movieid, directorid) VALUES (movieid, directorid) ON CONFLICT DO NOTHING;
END
$$ LANGUAGE 'plpgsql';


-- Funcao pra chamar as funcoes que normalizam
CREATE OR REPLACE FUNCTION  call_fix_director() RETURNS void AS
$$
BEGIN
    --renomeando a para tabela aual e criando uma nova com o nome antigo
    ALTER TABLE directorsmovies_slice RENAME TO directormovies_slice_old;
    CREATE TABLE directorsmovies_slice(movieid integer, directorid integer);
    ALTER TABLE directorsmovies_slice ADD PRIMARY KEY (movieid, directorid);
    --criacao de uma nova tabela com id e nome do diretor
    CREATE TABLE director_dname(directorid integer, dname character varying(50000), addition character varying(1000));
	  ALTER TABLE director_dname ADD PRIMARY KEY(directorid);
    PERFORM fix_director(directorid, dname, addition) FROM (SELECT DISTINCT t.directorid, t.dname, t.addition FROM directormovies_slice_old AS t) AS s;
    PERFORM fix_director_movie(movieid, directorid) FROM (SELECT DISTINCT t.movieid, t.directorid FROM directormovies_slice_old AS t) AS s;
    DROP TABLE directormovies_slice_old;

END
$$ LANGUAGE 'plpgsql';

-- Normatizando Campos
DO $$
  BEGIN
    PERFORM  call_fix_director();
END;
$$;
