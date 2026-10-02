/*
	ALTER TABLE - Cos'è e perchè si usa in sql server? 
	Alter table serve per modificare una tabella già esistente, 
	senza doverla ricreare.
	Con Alter Table :
	-	Aggiungere colonne.
	-	Modificare colonne.
	-	Eliminare colonne.
	-	Aggiungere vincoli(PRIMARY KEY, FOREIGN KEY, UNIQUE, CHECK)
	-	Eliminare vincoli.
	-	Rinominare colonne.
	-	Cambiare i tipi di dati 
	-	Modificare una colonna in default 
*/
-- Aggiunge una colonna nella tabella Studenti [si possono aggiungere anche più colonne]
ALTER TABLE Studenti
Add Indirizzo NVARCHAR(150) NULL
	Nazione CHAR(50) NULL,
	Provincia NVARCHAR(150) NULL;

-- Add AGGIUNGE UNA NUOVA COLONNA 
-- NULL significa che è opzionale (può accettare anche valori vuoti)

-- Modificare una colonna (Tipo di dato)
-- Obiettivo :
-- Cambiare il tipo di dato della colonna Telefono da (NVARCHAR(50) A VARCHAR(20))
ALTER TABLE Studenti
ALTER COLUMN Telefono VARCHAR(60) NOT NULL; --ALTER COLUMN modifica la colonna (ricordati che non puoi andar4e sotto il numero già inserito)

-- RINOMINARE UNA COLONNA 
EXEC sp_rename 'Studenti.Data_Nascita' , 'DataNascita'; 

-- ELIMINARE UNA COLONNA 
ALTER TABLE Studenti
DROP COLUMN Indirizzo, Nazione, Provincia; --DROP ELIMINA

-- AGGIUNGERE UNA FOREIGN KEY 
-- Aggiungere una FK alla tabella dei Voti(già presente nel nostro db)
ALTER TABLE Voti
ADD CONSTRAINT FK_Voti_Studenti
FOREIGN KEY (StudenteId) REFERENCES Studenti(StudenteId);

-- ELIMINARE/RIMUOVERE UNA FOREIGN KEY 
ALTER TABLE Voti
DROP CONSTRAINT  FK_Voti_Studenti;

-- AGGIUNGERE UN VINCOLO UNIQUE 
ALTER TABLE Studenti
ADD CONSTRAINT UQ_Studenti_Telefono UNIQUE(Telefono);

-- AGGIUNGERE UN VALORE DI  DEFAULT 
-- Impostare Superato = 1 nei voti 
ALTER TABLE Voti
ADD CONSTRAINT DF_Voti_Superato DEFAULT 1 FOR Superato ;