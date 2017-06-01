



-- DROPAR PK PRIMEIRAMENTE DE LANG
UPDATE lang SET lang = SUBSTRING(lang FROM '^([\w\-]+)');



-- Removendo duplicatas:
DELETE FROM lang WHERE EXISTS
(SELECT 1 FROM lang l2
	WHERE l2.movieid = lang.movieid AND
	l2.lang = lang.lang AND
	l2.ctid > lang.ctid
);

ALTER TABLE public.lang
  ADD PRIMARY KEY (movieid, lang);
