-- Le Funzioni Aggregate in SQL Server
/*
	Le funzioni aggregate permettono di 
	effettuare calcoli sulle righe 

	Le principali sono : 

	|COUNT ()   | Conta          |
	|-----------|----------------|
	|SUM()      | Somma          |
	|-----------|----------------|
	|AVG()      | Media          |
	|-----------|----------------|
	|MIN()      | Valore Minimo  |
	|-----------|----------------|
	|MAX()      | Valore Massimo |
	|-----------|----------------|
*/

-- 1 Totale righe degli studenti 
SELECT 
	COUNT(*) AS [Numero Totale degli Studenti]
FROM Studenti;

-- 2 COUNT / UNION ALL 
SELECT 'Studenti' AS Tabella, 
		COUNT (*) AS NumeroRighe 
FROM Studenti

UNION ALL 

SELECT 'Corsi' ,
		COUNT (*)
	FROM Corsi

UNION ALL 

SELECT 'Docenti',
	COUNT (*)
FROM Docenti

UNION ALL 

SELECT 'DocentiCorso',
		COUNT (*)
	FROM DocentiCorso

UNION ALL 

SELECT 'Aule' ,
	COUNT (*)
	FROM Aule

UNION ALL 

SELECT 'Iscrizioni',
	COUNT (*) 
	FROM Iscrizioni

UNION ALL 

SELECT 'Lezioni',
	COUNT (*)
	FROM Lezioni

UNION ALL 

SELECT 'Voti',
	COUNT (*)
	FROM Voti

	--------------------------------
--3 restituire la somma totale dei crediti della tabella 'Corsi'
SELECT --'Corsi' AS Tabella,
		SUM (Crediti) AS [Totale Crediti]
FROM Corsi;
/*SELECT DISTINCT 
	NomeCorso, 
	SUM (Crediti) AS [Totale Crediti]
FROM Corsi
GROUP by NomeCorso; */

--4 restituire la media dei crediti AVG() 
SELECT 
	AVG(Crediti) AS [Media dei Crediti] 
FROM Corsi;
--Media della durata
SELECT
	AVG(Durata) AS [Media della Durata]
FROM Corsi;
-- 5 trovare il valore minimo dei crediti 
SELECT 
	MIN(Crediti) AS [Valore Minimo dei Crediti]
FROM Corsi;
-- 6 Valore massimo
SELECT 
	MAX(Crediti) AS [Valore Massimo dei Crediti]
FROM Corsi;

----------------------------------------------------------
/*
	7 GROUP BY
	Il "GROUP BY" serve per raggruppare i record.
	per esempio, vogliamo sapere quanti docenti abbiamo per specializzazione
*/
SELECT 
	Specializzazione,
	COUNT(*) AS [Totale Docenti] 
FROM Docenti
GROUP BY Specializzazione;


-- 8 Lista totale dei docenti che hanno la specializzazione 
-- che cominciano con la lettera "D"
SELECT 
	Nome + ' ' + Cognome AS [Nome Completo],
	Specializzazione,
	COUNT(*) AS [Totale Docenti] 
FROM Docenti
WHERE Specializzazione LIKE 'd%'
GROUP BY Nome, Cognome, Specializzazione
ORDER BY Specializzazione ASC;

-- 9 HAVING 
-- HAVING serve per filtrare i gruppi con GROUP BY
-- Esempio 1:

-- Mostra solo la specializzazione che hanno almeno 3 
SELECT 
	Specializzazione,
	COUNT(*) AS [Totale Docenti] 
FROM Docenti
GROUP BY Specializzazione
HAVING COUNT(*) >= 3;
 
/* 
  	Differenza fondamentale tra 
		WHERE : filtraa le righe del raggruppamento 
		
		HAVING :  filtra i gruppi dopo il raggruppamento 

		Schema:
		SELECT
		FROM
		WHERE
		GROUP BY
		HAVING
			(SELECT 
			ORDER BY)
*/