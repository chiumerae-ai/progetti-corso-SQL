USE ScuolaDb;
GO

-- primo passo con selct
SELECT * FROM Studenti;

-- secondo passo con 'SELECT' 
/*
Esempio : 
select 
  colonna1, 
  colonna2, 
  ... 
  from tabella
*/

SELECT 
Nome , 
Cognome, 
Codicefiscale
FROM Studenti 

-- concatenazione di due colonne (+)
-- Aliass = as per definire il nome di una colonna durante la select 
--esempio 1
SELECT 
Nome + '- ' + Cognome AS NomeCompleto, 
Codicefiscale
FROM Studenti 

--esempio 2
SELECT 
Nome + '- ' + Cognome AS 'Nome Completo', 
Codicefiscale
FROM Studenti 

--esempio3
SELECT 
Nome + '- ' + Cognome AS [NomeCompleto], 
Codicefiscale AS [CF]
FROM Studenti 

SELECT * FROM Studenti ; 

-- Where filtra a secondo le condizioni 
-- es 1 : SELECT + ' - ' + Cognome AS 'Nome Completo', 
-- Codicefiscale,
-- Data_Nascita, 
--- FROM Studenti;
--Esempio :
SELECT
    Nome + ' - ' + cognome AS 'Nome Completo'
    Codicefiscale,
    Data_Nascita,
FROM Studenti;

-- IS NULL/ IS NOT NULL CON IL FILTRO Where
SELECT
    Nome + ' - ' + cognome AS 'Nome Completo',
    Codicefiscale,
    Data_Nascita
FROM Studenti
WHERE Data_Nascita IS NOT NULL ;

-- ORDER ordina  le colonne in ordine DESC/ ASC 
SELECT 
  Nome + ' ' + Cognome AS [Nome completo dello studente],
  Email,
  Data_Nascita,
  Codicefiscale
FROM Studenti
WHERE Data_nascita IS NULL
ORDER BY [Nome completo dello studente] DESC;

-- ORDER ASC 

SELECT 
  Nome + ' ' + Cognome AS [Nome completo dello studente],
  Email,
  Data_Nascita,
  Codicefiscale
FROM Studenti
WHERE Data_nascita IS NULL
ORDER BY [Nome completo dello studente] ASC;




