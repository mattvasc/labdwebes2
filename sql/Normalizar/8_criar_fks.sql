ALTER TABLE public.genre  ADD CONSTRAINT genre_fk_movie FOREIGN KEY (movieid) REFERENCES public.movies_slice (movieid)
   ON UPDATE SET DEFAULT ON DELETE SET DEFAULT;


ALTER TABLE public.act
  ADD CONSTRAINT act_fk_movie FOREIGN KEY (movieid) REFERENCES public.movies_slice (movieid)
   ON UPDATE SET DEFAULT ON DELETE SET DEFAULT;

ALTER TABLE public.act
  ADD CONSTRAINT act_fk_actor FOREIGN KEY (actorid) REFERENCES public.actor (actorid)
   ON UPDATE SET DEFAULT ON DELETE SET DEFAULT;

ALTER TABLE public.lang
  ADD CONSTRAINT lang_fk_movie FOREIGN KEY (movieid) REFERENCES public.movies_slice (movieid)
   ON UPDATE SET DEFAULT ON DELETE SET DEFAULT;