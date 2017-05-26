DROP ROLE IF EXISTS aluno;

CREATE ROLE aluno LOGIN
  ENCRYPTED PASSWORD 'md519ac35fc03f5e0156bc9411cf59c4367' -- A senha eh 'aluno'
  NOSUPERUSER INHERIT CREATEDB NOCREATEROLE NOREPLICATION;


ALTER TABLE public.act  OWNER TO aluno;
ALTER TABLE public.actor  OWNER TO aluno;
ALTER TABLE public.movies_slice  OWNER TO aluno;
ALTER TABLE public.directorsmovies_slice  OWNER TO aluno;
ALTER TABLE public.lang  OWNER TO aluno;
ALTER TABLE public.genre  OWNER TO aluno;
