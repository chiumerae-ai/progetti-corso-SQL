-- UPDATE è il comando SQL che MODIFICA i dati già esistenti dentro una tabella
SELECT * FROM Studenti; --katia - katYa
SELECT * FROM Studenti
WHERE StudenteId = 1;

--DA NON FARE ASSOLUTAMENTE X
--UPDATE Studenti
--SET Nome = 'katya'

UPDATE Studenti
SET Nome = 'katya'
WHERE StudenteId = 1;