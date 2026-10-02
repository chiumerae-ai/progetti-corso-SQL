/*
    JOIN / INNER JOIN
    LEFT JOIN  <--- Unisce partendo da sinistra (recupera anche i campi null)
    RIGHT JOIN ---> unisce partendo da destra
    FULL JOIN  ---- unisce tutto 

    --------------------------------------------------------------------

    JOIN — PERCHÉ SERVE?

    Fino a questo punto abbiamo lavorato principalmente con una tabella.

    Ma un database relazionale è composto da più tabelle collegate tra loro.

    Nel nostro database "ScuolaDb" abbiamo, per esempio:

    Studenti
       |
       ↓
    Iscrizioni
       |
       ↓
    Corsi

    Uno studente può essere iscritto a un corso.

    Per ottenere informazioni provenienti da più tabelle utilizziamo i JOIN.

    ----------------------------------------------------------------------

    Sintassi base della JOIN/ INNER JOIN 
    unisce 2 tabelle che hanno qualcosa in comune 

    SELECT 
        t1.colonna1
        t1.colonna2
        t1.colonna3
        t2.colonna1
        ...
    FROM tabella1 as t1
    Inner join tabella2 as t2
        ON Condizione (t1.Id = t2.Id)

*/

-- Restituire la lista degli studenti scritti
--SELCT * FROM Studenti, Iscrizioni; -- meno complessa, da non fare

SELECT *
FROM Studenti AS s    -- ricorda che la 's' qui deve essere uguale a quella dopo ON
INNER JOIN Iscrizioni AS i
    ON s.StudenteId = i.StudenteId; 

--es : nome completo dello studente. data di nascita . cf. data iscrizione 

SELECT 
    s.Nome + ' ' + Cognome as 'Nome completo' ,
    s.Data_Nascita as 'Data di nascita',
    s.CodiceFiscale as CF,
    i.DataIscrizione as [Data Iscrizione]
FROM Studenti as s
INNER JOIN Iscrizioni as i
    on s.StudenteId = i.StudenteId; 

    /*
    ----------- scritto dal prof ----------
    
/*

    JOIN / INNER JOIN 
    LEFT JOIN <- Parte da sinistra 
    RIGHT JOIN<- Parte da Destra
    FULL JOUIN 
    ___________________________________________________________________________
    JOIN — PERCHÉ SERVE?

    Fino a questo punto abbiamo lavorato principalmente con una tabella.

    Ma un database relazionale è composto da più tabelle collegate tra loro.

    Nel nostro database "ScuolaDb" abbiamo, per esempio:

    Studenti
       |
       ↓
    Iscrizioni
       |
       ↓
    Corsi

    Uno studente può essere iscritto a un corso.

    Per ottenere informazioni provenienti da più tabelle utilizziamo i JOIN.
    ___________________________________________________________________________________


    Sitassi base della JOIN / INNER JOIN 
    unisce 2 tabella che hanno qualcosa in comune 

    Select
        t1.colonne1
        t1.colonne2
        t1.colonne3
        t2.colonne1
        ....
    From tabella1 as t1
    Inner join tabella2 as t2
        ON Condizione (t1.id = t2.Id)
*/

-- Restituire la lista degli studenti scritti
SELECT * FROM Studenti, Iscrizioni; -- da non fare⚠️⚠️⚠️

-- Nome completo
-- Data Nascita
-- Codice fiscale
-- Data Iscrizione

SELECT 
    s.Nome + ' ' + s.Cognome as [Nome Completo],
    s.DataNascita as [Data di nascita],
    s.CodiceFiscale as CF,
    i.DataIscrizione as [Data Iscrizione]
FROM Studenti as s
INNER JOIN Iscrizioni as i
    On s.StudenteId = i.StudenteId;
*/ 


-- esempio 2 : 
-- Restituisci la lista degli studenti iscritti a un corso
SELECT 
    s.Nome + ' ' + Cognome as 'Nome completo' ,
    s.Data_Nascita as 'Data di nascita',
    s.CodiceFiscale as CF,
    i.DataIscrizione as [Data Iscrizione],
    c.NomeCorso + '-' + c.Descrizione as [Corso],
    c.Durata
FROM Studenti as s
INNER JOIN Iscrizioni as i
    on s.StudenteId = i.StudenteId
INNER JOIN Corsi as c
    On i.CorsoId = c.CorsoId;

  --3 studenti iscritti a un corso con data di nascita nulla
SELECT 
    s.Nome + ' ' + Cognome as 'Nome completo' ,
    s.Data_Nascita as 'Data di nascita',
    s.CodiceFiscale as CF,
    i.DataIscrizione as [Data Iscrizione],
    c.NomeCorso + '-' + c.Descrizione as [Corso],
    c.Durata
FROM Studenti as s
INNER JOIN Iscrizioni as i
    on s.StudenteId = i.StudenteId
INNER JOIN Corsi as c
    On i.CorsoId = c.CorsoId
WHERE s.Data_Nascita IS NULL; --is not null;

/* esercizio comune :
    Docenti, Corsi, Aule, Lezioni 
    sapendo che le Lezioni comunicano con le Aule , 
    le aule con i corsi ( Lezioni <-> Aule <-- Corsi)
    Iscrizioni comunica con gli Studenti , che comunica 
    con i Corsi ( Iscrizioni <-> Studenti <-- Corsi)
    (DocentiCorsi <- Docenti)    

--Restituire :
    il nome dello studente ,
    il corso,
    l'aula,
    Docente,
    le lezioni
    */
    Select * from Studenti; --studemteId
    select * from Iscrizioni;--corsoId/StudenteId
    Select * from Corsi; --corsoid
    SELECT * from DocentiCorso;
    SELECT * FROM Docenti;
    SELECT * from Lezioni;
    select * from Aule;

SELECT *
FROM Studenti as s
INNER JOIN Iscrizioni as i
    on s.StudenteId = i.StudenteId
INNER JOIN Corsi as c
    On i.CorsoId = c.CorsoId
INNER JOIN DocentiCorso as dc
    On dc.CorsoId = c.CorsoId
INNER JOIN Docenti as d
    ON d.DocenteId = c.CorsoId 
INNER JOIN Lezioni as l
    ON c.CorsoId = l.CorsoId
INNER JOIN Aule as a
    On a.AulaId = l.AulaId;

-- naturalmente se volessimo non avere i 'doppioni' si scrive cosi :
SELECT DISTINCT
    s.Nome + ' ' + s.Cognome as 'Nome Studente' ,
    s.Data_Nascita as 'Data di nascita',
    s.CodiceFiscale as CF,
    i.DataIscrizione as [Data Iscrizione],
    c.NomeCorso + '-' + c.Descrizione as [Corso],
    c.Durata,
    d.Nome + '-' + d.Cognome  as [Nome Docente],
    d.Specializzazione,
    a.NomeAula as [Nome Aula],
    a.Capacita as [Capacità]
FROM Studenti as s
INNER JOIN Iscrizioni as i
    on s.StudenteId = i.StudenteId
INNER JOIN Corsi as c
    On i.CorsoId = c.CorsoId
INNER JOIN DocentiCorso as dc
    On dc.CorsoId = c.CorsoId
INNER JOIN Docenti as d
    ON d.DocenteId = c.CorsoId 
INNER JOIN Lezioni as l
    ON c.CorsoId = l.CorsoId
INNER JOIN Aule as a
    On a.AulaId = l.AulaId;
  
---------------------------------------------------

SELECT 
     s.Nome + '-' + s.Cognome [Nome Completo], 
     c.NomeCorso,
     c.Descrizione
FROM Studenti s 
JOIN Iscrizioni  i
    ON i.StudenteId = s.StudenteId
JOIN Corsi c 
    ON c.CorsoId = i.CorsoId;

--
/*
	Restituire la lista degli studenti iscritti ad un corso SENZA la data di nascita, 
	mostrando:
		Nome completo
		Data di nascita (rinominata)
		Codice Fiscale
		Corso
		Voto
		Docente
		Aula
*/
SELECT 
    CONCAT(s.Nome, ' ', s.Cognome) AS [NomeCompleto],
    ISNULL(CONVERT(VARCHAR(10), s.Data_Nascita, 120), 'Non registrata') AS Data_di_Nascita,
    s.CodiceFiscale AS CF,
    c.NomeCorso AS Corso,
    CAST(AVG(v.Voto) AS INT) AS Voto,
    CONCAT(d.Nome, ' ', d.Cognome) AS Docente,
    a.NomeAula AS Aula
FROM Studenti s
JOIN Iscrizioni i 
    ON s.StudenteId = i.StudenteId
JOIN Corsi c 
    ON i.CorsoId = c.CorsoId
JOIN Voti v 
    ON s.StudenteId = v.StudenteId 
    AND c.CorsoId = v.CorsoId
JOIN DocentiCorso dc 
    ON c.CorsoId = dc.CorsoId
JOIN Docenti d 
    ON dc.DocenteId = d.DocenteId
JOIN Lezioni l 
    ON c.CorsoId = l.CorsoId
JOIN Aule a 
    ON l.AulaId = a.AulaId
WHERE s.Data_Nascita IS NULL
GROUP BY s.Nome, s.Cognome, s.Data_Nascita, s.CodiceFiscale, c.NomeCorso, d.Nome, d.Cognome, a.NomeAula;