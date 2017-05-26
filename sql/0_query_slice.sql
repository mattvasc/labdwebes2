
DROP TABLE IF EXISTS movies_slice;
DROP TABLE IF EXISTS directorsmovies_slice;
-- Cria cão das tabelas:
CREATE TABLE public.movies_slice
(
  movieid integer,
  title character varying(400),
  mvyear character varying(100),
  actorid integer,
  actorname character varying(250),
  sex character(1),
  as_character character varying(1000),
  languages character varying(1000),
  genres character varying(100)
)
WITH (
  OIDS=FALSE
);


CREATE TABLE public.directorsmovies_slice
(
  movieid integer,
  directorid integer,
  dname character varying(50000),
  addition character varying(1000)
)
WITH (
  OIDS=FALSE
);


-- Povoa mentos das tabelas:
INSERT INTO public.movies_slice(
            movieid, title, mvyear, actorid, actorname, sex, as_character,
            languages, genres)
SELECT movieid, title, mvyear, actorid, actorname, sex, as_character,
       languages, genres
  FROM public.movies LIMIT 500;

  INSERT INTO public.directorsmovies_slice(
              movieid, directorid, dname, addition)
    SELECT movieid, directorid, dname, addition
    FROM public.directorsmovies LIMIT 50000;
