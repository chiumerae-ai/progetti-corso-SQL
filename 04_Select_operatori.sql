/*
	Operatori principali in sql server 
		operatore di confronto :
		=      = Uguale
		<> / ! = Diverso da 
		<      = Minore
		>      = Maggiore
		<=     = Minore uguale
		>=     = Maggiore uguale
		AND    = E
		OR     = O 
*/

-- 1 UGUALE : 
SELECT
	StudenteId, 
	Nome,
	Cognome,
	Email
FROM Studenti
WHERE StudenteId = 4;


--2 restituire tutti gli studenti tranne con Id (5)
SELECT * FROM Studenti
WHERE StudenteId <> 5;
/* correzione prof:
SELECT 
FROM Studenti
WHERE StudenteId <> 5;
*/ 
/* 3 oppure per non avere i valori nulli 
SELECT 
StudenteId,
Nome,
Cognome,
Email
FROM Studenti
WHERE StudenteId <> 5
*/ 
--4 MAGGIORE >
-- Restituire i corsi che hanno più di 5 crediti( ho usato Distinct perchè ci sono duplicati, altrimenti senza §DISTINCT e NomeCorso ecc ecc )
SELECT DISTINCT
NomeCorso,
Descrizione,
Crediti,
Durata
FROM Corsi WHERE Crediti > 5 ;
/*SELECT * FROM Studenti
WHERE StudenteId > 5; */ 

--5 MINORE <
-- Restituire i corsi che hanno meno di 5 crediti
SELECT DISTINCT 
NomeCorso,
Descrizione,
Crediti,
Durata
From Corsi WHERE Crediti <5;
/*SELECT 
FROM Studenti
WHERE StudenteId < 5; */ 

--6 MAGGIORE O UGUALE >=
-- Restituire i corsi con almeno 5 crediti 
SELECT DISTINCT 
NomeCorso,
Descrizione,
Crediti,
Durata
From Corsi WHERE Crediti >=5;
-- per minore o uguale è la stessa cosa <=
SELECT DISTINCT 
NomeCorso,
Descrizione,
Crediti,
Durata
From Corsi WHERE Crediti <=5;

/*
	7	AND significa (E) 
		Tutte le condizioni devono essere vere.
*/ 
/*
Restituire i corsi con almeno 5 crediti 
e la durata deve essere maggiore di 50 ore 
*/ 
SELECT DISTINCT 
NomeCorso,
Descrizione,
Crediti,
Durata
From Corsi WHERE Crediti >=5 AND Durata > 50;

--8  OR = O/OPPURE (se una condizione è vera O no)
-- Restituire la lista dei corsi con 5 crediti oppure con 3 crediti
SELECT DISTINCT 
NomeCorso,
Descrizione,
Crediti,
Durata
From Corsi WHERE Crediti =5 OR Crediti =3;

/* =================================
	9 FILTRO DEGLI STUDENTI PER NOME 
 ================================= */
	SELECT * FROM Studenti WHERE Nome= 'Anna';

/* =================================
	10 FILTRO DEGLI STUDENTI PER COGNOME
 ================================= */
 SELECT * FROM Studenti WHERE Cognome= 'Rossi' ;

 /* =================================
	11 CONDIZIONE SU UNA DATA 
 ================================= */
 SELECT 
	Nome + ' ' + Cognome AS [Nome Completo],
	Data_Nascita AS  [Data di nascita],
	Email
FROM Studenti
WHERE Data_nascita > '2002'
ORDER BY [Nome Completo] ASC; 


/* ============================================================
   12. AND CON LE DATE
    Esercizio 1:
        Restituire la lista degli Studenti 
        nati tra il 2001 e il 2002
   ============================================================ */

SELECT 
	Nome + ' ' + Cognome AS [Nome Completo],
	Data_Nascita AS DataNascita
FROM Studenti 
WHERE Data_nascita >= '2001-01-01' AND Data_nascita <= '2002-12-31'

SELECT * FROM Studenti;

--13 LIMIT in sql server (TOP) = LIMITA 

SELECT TOP 10 * FROM Studenti;

SELECT TOP 10 * 
FROM Studenti
WHERE Data_Nascita IS NOT NULL;

--14 IN = ci permette di restituire la lista degli elementi che si trovano all interno di una lista

SELECT * FROM Corsi
WHERE Crediti IN (6,5);

SELECT * FROM Corsi
WHERE Crediti IN (6,5)
ORDER BY Crediti ASC;
--se ne voglio solo 5
SELECT TOP 5 * FROM Corsi
WHERE Crediti IN (6,5)
ORDER BY Crediti;
-- 15 Nome corso TOP 10
SELECT TOP 10 * FROM Corsi
WHERE Crediti IN (6,5)
ORDER BY NomeCorso ASC;

/* 16 BETWEEN = permette di verificare se un valore si trova all'interno di un
intervallo . SINTASSI : 
SELECT * FROM <TABELLA>
WHERE colonna BETWEEN valore MINIMO (<) AND valore Massimo (>)
*/ 
-- Corsi con una durata compresa tra 30 e 50 ore 

SELECT DISTINCT 
	NomeCorso AS [Nome del corso],
	Descrizione,
	Durata
FROM Corsi
WHERE Durata BETWEEN 30 AND 50;

--17 restituisce la lista dei primi 5 corsi con una durataa tra 30 e 50 ore

SELECT DISTINCT TOP 5
	NomeCorso AS [Nome del corso],
	Descrizione,
	Durata
FROM Corsi
WHERE Durata BETWEEN 30 AND 50;

-- come la 17 però con ordine ASCENDENTE 
SELECT DISTINCT TOP 5
	NomeCorso AS [Nome del corso],
	Descrizione,
	Durata
FROM Corsi
WHERE Durata BETWEEN 30 AND 50
ORDER BY [Nome del corso] ASC;

-- 18 Restituire la lista degli studenti nati tra il 2000 e 2002
-- campi da restituire : Nome completo e Data di nascita 
SELECT * FROM Studenti;

SELECT 
	Nome + ' ' + Cognome AS [Nome Completo],
	Data_Nascita AS [Data di Nascita]
FROM Studenti 
WHERE Data_nascita BETWEEN '2000' AND '2002-12-31';

/*19--- IN --- se non si vuole ripetere più volte or or or 

eS:
SELECT *
FROM Corsi
WHERE Crediti = 3
	or Crediti = 5 
	or Crediti = 6 
--per evitare che diventi troppo lunga 
 SELECT *
 fROM Corsi
 where Crediti IN (3,5,6);
 */ 

 SELECT *
 FROM Corsi
 WHERE Crediti IN (3,5,6) ; 

 -- c'è la possibilità di utilizzare la NOT IN 
 SELECT *
 FROM Corsi
 WHERE Crediti NOT IN (3, 5, 6);

/*- 20 parola chiave : LIKE : 
		A% = Restituisce tutti i nome che cominciano con la lettera a
		%O = Restituisce tutti i nomi che finiscono con la lettera O 
		%U% = Restituisce tutti i nomi che contengono la lettera U 

			ESEMPIO 1:
		Restituire la lista dei corsi che cominciano con la lettera P 
*/

SELECT DISTINCT 
	NomeCorso,
	Descrizione,
	Crediti,
	Durata
FROM Corsi
WHERE NomeCorso Like '%O'; 