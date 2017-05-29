CREATE OR REPLACE FUNCTION fix_actor_and_act(movieid integer,actorid integer, actorname character varying(250), sex character (1), as_character character varying(250)) RETURNS void AS
$$
BEGIN
    INSERT INTO actor (actorid, actorname) VALUES (actorid, actorname) ON CONFLICT DO NOTHING;
    INSERT INTO act (movieid, actorid, as_character, sex) VALUES (movieid, actorid, as_character, sex);
END
$$ LANGUAGE 'plpgsql';

CREATE OR REPLACE FUNCTION call_fix_actor_and_act() RETURNS void AS
  $$
  BEGIN
	DROP TABLE IF EXISTS actor;
	DROP TABLE IF EXISTS act;

      -- Criar tabelas
      CREATE TABLE actor
      (
        actorid integer,
        actorname text
      );
      CREATE TABLE act
      (
        movieid integer,
        actorid integer,
        as_character text,
        sex character (1)
      );
	-- Criando PK's
	ALTER TABLE act ADD PRIMARY KEY(movieid, actorid, as_character);
	ALTER TABLE actor ADD PRIMARY KEY (actorid);
      -- Povoar Tabelas
      PERFORM fix_actor_and_act(movieid, actorid, actorname, sex, as_character) FROM (SELECT DISTINCT t.movieid, t.actorid, t.actorname, t.sex, t.as_character FROM movies_slice AS t) AS s; -- is ok
      -- Dropar colunas da tabela original
      ALTER TABLE movies_slice DROP COLUMN actorname, DROP COLUMN actorid, DROP COLUMN sex, DROP COLUMN as_character;
		
			
  END
$$ LANGUAGE 'plpgsql';

-- Normatizando Campos
DO $$
  BEGIN
    PERFORM call_fix_actor_and_act(); -- executar o fix_actor
END;
$$;
