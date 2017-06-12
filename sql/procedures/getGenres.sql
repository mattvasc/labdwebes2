-- Function: public.getgenres()

-- DROP FUNCTION public.getgenres();

CREATE OR REPLACE FUNCTION public.getgenres()
  RETURNS SETOF character varying AS
$BODY$
     SELECT DISTINCT genre FROM genre ORDER BY genre;
$BODY$
  LANGUAGE sql VOLATILE
  COST 100
  ROWS 1000;
ALTER FUNCTION public.getgenres()
  OWNER TO postgres;

