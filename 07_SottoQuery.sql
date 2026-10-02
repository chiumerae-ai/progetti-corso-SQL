/*
	COSA SONO LE SOTTOQUERY?
	Una sottoquery è una query dentro un'altra query.
	Serve per:
		filtrare dati usando risultati di altre tabelle 
		calcolare valori intermedi
		sostituire JOIN quando vuoi logica più compatta
		creare condizioni avanzate nel WHERE,HAVING, SELECT
*/

-- 1. SOTTOQUERY nel WHERE
-- Obiettivo
-- Trovare gli studenti che hanno preso il voto massimo in tutti i corsi.

-- passo 1 Trovare il voto massimo
SELECT MAX(Voto) [Voto Massimo] FROM Voti;
-- trasformarlo in intero 
SELECT CAST(MAX(Voto) as INT) [Voto Massimo] FROM Voti; --30

--Query finale sottoquery (SubQuery)
SELECT 
	s.Nome, 
	s.Cognome, 
	v.Voto
FROM Studenti s 
JOIN Voti v
	ON s.StudenteId=v.StudenteId
WHERE v.Voto=30; 
--non si usano mai i numeri es '30' quindi :
SELECT 
	s.Nome, 
	s.Cognome, 
	v.Voto
FROM Studenti s 
JOIN Voti v
	ON s.StudenteId=v.StudenteId
WHERE v.Voto = ( 
	SELECT CAST(MAX(Voto) as INT) [Voto Massimo] 
	FROM Voti
);

--2. SOTTOQUERY nel SELECT
-- Obiettivo
-- Mostrare ogni studente con la media dei suoi voti (senza GROUP BY)

-- passo 1 Restituire la lista di tutti gli studenti 
SELECT * FROM Studenti;
-- con la media dei voti
SELECT 
	AVG(Voto) [Voto Medio]
FROM Voti;

-- passo 3 unire le due query sopra per ottenere il risultato 
-- per ogni studente la sottoquery calcola la sua media 
SELECT 
	Nome,
	Cognome,
	CodiceFiscale,
	(
		SELECT 
			AVG(Voto) [Voto Medio]
		FROM Voti
		) AS [Media Voti]
FROM Studenti;

-- 3. SOTTOQUERY con IN 
-- Obiettivo
-- Trovare gli studenti che hanno preso almeno un voto >=28.

-- pass 1 Restituire la lista degli studenti 
SELECT 
	Nome, 
	Cognome,
	CodiceFiscale
FROM Studenti;

-- passo 2 restituire i voti >= 28
SELECT 
	Voto
FROM Voti
WHERE Voto >= 28;
-- passo 3 unire i due passi usando il filtro seguito da IN

SELECT 
	Nome, 
	Cognome,
	CodiceFiscale
FROM Studenti
WHERE StudenteId IN (
					SELECT
					  StudenteId
					FROM Voti
					WHERE Voto >= 28
					);

-- 4. SOTTOQUERY con EXISTS
--Obiettivo
--Mostrare gli studenti che hanno almeno un voto registrato.
-- passo 1 : elenco del nome e cognome di tutti gli studenti 
SELECT 
	Nome, 
	Cognome
FROM Studenti;

--passo 2 : Exists 1 
SELECT 1 
FROM Voti
WHERE StudenteId = 2;

-- Query finale 
SELECT 
	Nome, 
	Cognome
FROM Studenti s
WHERE EXISTS ( -- EXISTS controlla se la sottoquery trova almeno una riga
		SELECT 1 
		FROM Voti v
		WHERE s.StudenteId = v.StudenteId
);

-- 5. SOTTOQUERY correlata (avanzata)
-- Obiettivo
-- Mostrare gli studenti che hanno preso un voto superiore alla media generale.

-- passo 1 : Media dei voti
SELECT
	AVG(Voto) [La media dei voti] --> 25.90
FROM Voti;

-- la query finale 
SELECT 
	Nome, 
	Cognome
FROM Studenti s
INNER JOIN Voti v 
	ON s.StudenteId=v.StudenteId
WHERE v.Voto > ( -- La sottoquery calcola la media 
	SELECT
		AVG(Voto) --> 25.90
FROM Voti
);

--6. SOTTOQUERY con JOIN (super avanzata)
-- Obiettivo
-- Mostrare i corsi che hannouna media voti superiori alla media di tutti i corsi.

-- 7. SOTTOQUERY per trovare studenti senza data di nascita
-- Obiettivo
-- Mostrware studenti iscritti a corrsi senza data di nascita, usando sottoquery