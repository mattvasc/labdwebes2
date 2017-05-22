DROP TABLE IF EXISTS original;
DROP TABLE IF EXISTS arrumada;

CREATE TABLE original(id int, coisa text);
ALTER TABLE original ADD PRIMARY KEY(id);
INSERT INTO original VALUES (1, 'a;b;c');
INSERT INTO original VALUES (2, 'a;b;c');
INSERT INTO original VALUES (3, 'a;e;c;i;o');

CREATE TABLE arrumada(id int, coisa text);
-- Enfâse na pk composta, diferente de anteriormente:
ALTER TABLE arrumada ADD PRIMARY KEY(id,coisa);
INSERT INTO arrumada (id,coisa) (SELECT id, unnest(string_to_array(coisa, ';')) FROM original); 

--Testem agora supimpos:

--SELECT * FROM original;
--SELECT * FROM arrumada;
