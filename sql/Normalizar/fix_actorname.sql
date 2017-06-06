
UPDATE actor SET actorname =  TRIM(SUBSTRING(actorname FROM '.+?(?=\()')) WHERE actorname LIKE '%(%';
UPDATE actor SET actorname = SUBSTRING(actorname FROM ',\s*(.*)') || ' ' || SUBSTRING(actorname FROM '^([\w\-]+)') WHERE actorname LIKE '%, %';