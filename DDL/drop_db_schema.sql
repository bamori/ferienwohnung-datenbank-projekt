--lösche zuerst Trigger
DROP TRIGGER trg_storniere_buchung;

--Views löschen
DROP VIEW GuteFluggesellschaften;
DROP VIEW MidAgeKunden;
DROP VIEW Zahlungstatus;
DROP VIEW UebersichtKunden;
DROP VIEW Familienwohnungen;
DROP VIEW Reservierung;
DROP VIEW Buchung;
DROP FUNCTION preis;
DROP SEQUENCE seq_stornierungsnummer;
DROP TABLE Stornierte_Buchung;
-- 1. Abhängige Tabellen (mit Foreign Keys)
DROP TABLE umfasst ;
DROP TABLE entfernt ;
DROP TABLE beinhaltet ;
DROP TABLE Touristenattraktion ;
DROP TABLE Rechnung ;
DROP TABLE Belegungen ;
DROP TABLE Bild ;
DROP TABLE Ferienwohnung ;
DROP TABLE Zusatzausstattung ;
DROP TABLE Kunde ;
DROP TABLE Bankverbindung ;
ALTER TABLE Ort DROP CONSTRAINT FK_Ort_Flughafen;
DROP TABLE Flughafen ;
DROP TABLE Adresse ;
DROP TABLE Ort ;
DROP TABLE Fluggesellschaften ;
DROP TABLE Land ;