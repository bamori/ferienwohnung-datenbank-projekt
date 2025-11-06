ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD'; 

--entfernt löschen
DELETE FROM entfernt;

--umfasst löschen
DELETE FROM umfasst;

--Touristenattraktion löschen
DELETE FROM Touristenattraktion;

--Rechnung löschen
DELETE FROM Rechnung;

-- Zuerst stornierte Buchungen löschen (Archiv-Tabelle)
DELETE FROM Stornierte_Buchung;

--Belegungen löschen
DELETE FROM Belegungen;

--beinhaltet löschen
DELETE FROM beinhaltet;

--Bild löschen
DELETE FROM Bild;

--Ferienwohnung löschen
DELETE FROM Ferienwohnung;

--Zusatzausstattungen löschen
DELETE FROM Zusatzausstattung;

--Bankverbindung löschen
DELETE FROM Bankverbindung;

--Kunde löschen
DELETE FROM Kunde;

--Fluggesellschaft löschen
DELETE FROM Fluggesellschaften;

--Flughafen löschen
DELETE FROM Flughafen;

--Adresse löschen
DELETE FROM Adresse;

--Ort löschen
DELETE FROM Ort;

--Länder löschen
DELETE FROM Land;


COMMIT;