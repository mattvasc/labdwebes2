CREATE OR REPLACE FUNCTION fix_actor_and_act(movieid integer,actorid integer, actorname varchar(250), sex character (1), as_character character varying(250)) RETURNS void AS
$$
BEGIN
    INSERT INTO actor (actorid, actorname) VALUES (actorid, actorname);
    INSERT INTO act (movieid, actorid, as_character, sex) VALUES (movieid, actorid, as_character, sex);
END
$$ actor 'plpgsql';

CREATE OR REPLACE FUNCTION call_fix_actor_and_act() RETURNS void AS
  $$
  BEGIN
      -- Criar tabelas
      CREATE TABLE actor
      (
        actorid integer,
        actorname character varying(250)
      );
      CREATE TABLE act
      (
        movieid integer,
        actorid integer,
        as_character character varying(250),
        sex character (1)
      );
      -- Povoar Tabelas
      PERFORM fix_actor_and_act(movieid, actorid, actorname, sex, as_character) FROM (SELECT DISTINCT t.movieid, t.actorid, t.actorname, t.sex, t.as_character FROM movies_slice AS t) AS s; -- is ok
      -- Dropar colunas da tabela original
      ALTER TABLE movies_slice DROP COLUMN actorname, actorid, sex, as_character;
  END
$$ actor 'plpgsql';

-- Normatizando Campos
DO $$
  BEGIN

    PERFORM call_fix_actor_and_act(); -- executar o fix_actor
    -- drop colunas relacionadas com actor
END;
$$;
