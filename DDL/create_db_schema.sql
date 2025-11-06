-- Tabelle Land
CREATE TABLE Land (
    ISO_Code CHAR(3) CONSTRAINT PK_Land PRIMARY KEY,
    Name VARCHAR2(100) NOT NULL CONSTRAINT AK_Land_Name UNIQUE
);

-- Tabelle Fluggesellschaft
CREATE TABLE Fluggesellschaften (
    IATA_Code CHAR(256) CONSTRAINT PK_Fluggesellschaften PRIMARY KEY,
    Name VARCHAR2(256) NOT NULL CONSTRAINT AK_Fluggesellschaften_Name UNIQUE,
    Qualität NUMBER NOT NULL CHECK (Qualität > 0 AND Qualität < 11)
);

-- Tabelle Ort
CREATE TABLE Ort (
    Ort_ID NUMBER CONSTRAINT PK_Ort PRIMARY KEY,
    Name VARCHAR2(100) NOT NULL,
    ISO_Code CHAR(3) NOT NULL,
    EntfernungFlughafen NUMBER NOT NULL,
    Flughafen_ID CHAR(3),
    CONSTRAINT FK_Ort_Land FOREIGN KEY (ISO_Code) REFERENCES Land(ISO_Code) ON DELETE CASCADE
);

COMMENT ON COLUMN Ort.ISO_CODE IS 'FK auf Land mit ON DELETE CASCADE: Beim Löschen eines Landes werden alle zugehörigen Orte automatisch mit gelöscht.';



-- Tabelle Adresse
CREATE TABLE Adresse (
    Adresse_ID NUMBER CONSTRAINT PK_Adresse PRIMARY KEY,
    PLZ VARCHAR2(5) NOT NULL,
    Strasse VARCHAR2(100) NOT NULL,
    Hausnummer VARCHAR2(10) NOT NULL,
    Ort_ID NUMBER NOT NULL,
    CONSTRAINT FK_Adresse_Ort FOREIGN KEY (Ort_ID) REFERENCES Ort(Ort_ID) ON DELETE CASCADE
);

COMMENT ON COLUMN Adresse.ORT_ID IS 'FK auf Ort mit ON DELETE CASCADE: Beim Löschen eines Orts werden alle zugehörigen Adressen mit gelöscht.';

-- Tabelle Flughafen
CREATE TABLE Flughafen (
    IATA_Code CHAR(3) CONSTRAINT PK_Flughafen PRIMARY KEY,
    Name VARCHAR2(256) NOT NULL,
    Adresse_ID NUMBER NOT NULL,
    CONSTRAINT FK_Flughafen_Adresse FOREIGN KEY (Adresse_ID) REFERENCES Adresse(Adresse_ID)
);

COMMENT ON COLUMN Flughafen.ADRESSE_ID IS 
'FK auf Ort – DEFERRABLE INITIALLY DEFERRED: Ort und Flughafen können sich gegenseitig referenzieren. Prüfung erfolgt erst am Ende der Transaktion.';

-- Nachträgliche Verbindung von Ort zu Flughafen
ALTER TABLE Ort
ADD CONSTRAINT FK_Ort_Flughafen FOREIGN KEY (Flughafen_ID) REFERENCES Flughafen(IATA_Code)
DEFERRABLE INITIALLY DEFERRED;

-- Tabelle Bankverbindung
CREATE TABLE Bankverbindung (
    IBAN VARCHAR2(22) CONSTRAINT PK_Bankverbindung PRIMARY KEY,
    BLZ VARCHAR2(15) NOT NULL,
    BIC VARCHAR2(11) NOT NULL,
    Kontonummer VARCHAR2(10) NOT NULL,
    Kundennummer NUMBER NOT NULL,
    CONSTRAINT AK_Bankverbindung_BLZ_Kontonummer UNIQUE (BLZ, Kontonummer),
    CONSTRAINT AK_Bankverbindung_BIC_Kontonummer UNIQUE (BIC, Kontonummer)
);

COMMENT ON TABLE Bankverbindung IS 'Alternativschlüssel = {Kontonummer, BLZ}, {Kontonummer, BIC}';

-- Tabelle Kunde
CREATE TABLE Kunde (
    Kundennummer NUMBER CONSTRAINT PK_Kunde PRIMARY KEY,
    Nachname VARCHAR2(50) NOT NULL,
    Vorname VARCHAR2(50) NOT NULL,
    E_Mail VARCHAR2(256) NOT NULL,
    Telefonnummer VARCHAR2(20) NOT NULL,
    Geburtsdatum DATE NOT NULL,
    IBAN VARCHAR2(22) NOT NULL,
    Adresse_ID NUMBER NOT NULL,
    CONSTRAINT FK_Kunde_Bankverbindung FOREIGN KEY (IBAN) REFERENCES Bankverbindung(IBAN) ON DELETE CASCADE,
    CONSTRAINT AK_Kunde_IBAN UNIQUE (IBAN),
    CONSTRAINT FK_Kunde_Adresse FOREIGN KEY (Adresse_ID) REFERENCES Adresse(Adresse_ID),
    CONSTRAINT AK_Kunde_Adresse_ID UNIQUE (Adresse_ID)
);

COMMENT ON COLUMN Kunde.IBAN IS 
'FK auf Ferienwohnung – DEFERRABLE INITIALLY DEFERRED: Eine Belegung kann eingefügt werden, auch wenn die Ferienwohnung erst später in derselben Transaktion angelegt wird.';

-- Tabelle Zusatzausstattung
CREATE TABLE Zusatzausstattung (
    Name VARCHAR2(100) PRIMARY KEY
);

-- Tabelle Ferienwohnung
CREATE TABLE Ferienwohnung (
    Wohnungs_ID NUMBER CONSTRAINT PK_Ferienwohnung PRIMARY KEY,
    Beschreibung VARCHAR2(250) NOT NULL,
    Anzahl_der_Zimmer NUMBER NOT NULL CHECK (Anzahl_der_Zimmer > 0),
    Groesse_in_qm NUMBER NOT NULL CHECK (Groesse_in_qm > 0),
    Preis NUMBER(10,2) NOT NULL CHECK (Preis > 0),
    Adresse_ID NUMBER NOT NULL,
    CONSTRAINT FK_FW_Adresse FOREIGN KEY (Adresse_ID) REFERENCES Adresse(Adresse_ID) ON DELETE CASCADE DEFERRABLE INITIALLY IMMEDIATE
);

COMMENT ON COLUMN Ferienwohnung.ADRESSE_ID IS 
'FK auf Adresse mit ON DELETE CASCADE: Wird eine Adresse gelöscht, wird die zugehörige Ferienwohnung ebenfalls gelöscht.';

-- Tabelle Bild
CREATE TABLE Bild (
    Bild_ID NUMBER NOT NULL CONSTRAINT PK_Bild PRIMARY KEY,
    Beschreibung VARCHAR2(300) NOT NULL,
    Dateipfad VARCHAR2(300) NOT NULL CONSTRAINT AK_Bild_Dateipfad UNIQUE,
    Wohnungs_ID NUMBER NOT NULL,
    CONSTRAINT FK_Bild_Ferienwohnung FOREIGN KEY (Wohnungs_ID) REFERENCES Ferienwohnung(Wohnungs_ID)
);

COMMENT ON TABLE Bild IS 'Maximal vier Bilder pro Ferienwohnung erlaubt';

-- Tabelle Belegung
CREATE TABLE Belegungen (
    Belegungsnummer NUMBER CONSTRAINT PK_Belegung PRIMARY KEY,
    Datum DATE DEFAULT SYSDATE NOT NULL,
    Von DATE NOT NULL,
    Bis DATE NOT NULL,
    Status VARCHAR2(30) NOT NULL CHECK (Status IN ('Reserviert', 'Gebucht')),
    Wohnungs_ID NUMBER NOT NULL,
    Kundennummer NUMBER NOT NULL,
    CONSTRAINT CHK_Belegung_Zeitraum CHECK (Von <= Bis AND Von >= Datum),
    CONSTRAINT FK_Belegung_FW FOREIGN KEY (Wohnungs_ID) REFERENCES Ferienwohnung(Wohnungs_ID)
    DEFERRABLE INITIALLY DEFERRED,
    CONSTRAINT FK_Belegung_Kunde FOREIGN KEY (Kundennummer) REFERENCES Kunde(Kundennummer) ON DELETE SET NULL
);

COMMENT ON TABLE Belegungen IS 'Eine Belegung kann eine Reservierung sein oder eine Buchung, aber nicht beides gleichzeitig';
COMMENT ON TABLE Belegungen IS 'Eine Reservierung kann in eine Buchung umgewandelt werden, aber icht andersrum';
COMMENT ON TABLE Belegungen IS 'Eine Belegung kann nur erfolgen, wenn die Ferienwohnung für den Zeitraum verfügbar ist';


-- Tabelle Rechnung
CREATE TABLE Rechnung (
    Rechnungsnummer VARCHAR2(22) CONSTRAINT PK_Rechnung PRIMARY KEY,
    Zahlungseingangsdatum DATE,
    Rechnungsdatum DATE NOT NULL,
    Betrag NUMBER(10,2) NOT NULL,
    Belegungsnummer NUMBER NOT NULL,
    CONSTRAINT FK_Rechnung_Belegungen FOREIGN KEY (Belegungsnummer) REFERENCES Belegungen(Belegungsnummer)
    DEFERRABLE INITIALLY DEFERRED
);

-- Tabelle Touristenattraktion
CREATE TABLE Touristenattraktion (
    Name VARCHAR2(256) PRIMARY KEY,
    Beschreibung VARCHAR2(256) NOT NULL,
    Adresse_ID NUMBER NOT NULL,
    CONSTRAINT FK_Attraktion_Adresse FOREIGN KEY (Adresse_ID) REFERENCES Adresse(Adresse_ID)
);

-- Tabelle beinhaltet
CREATE TABLE beinhaltet (
    Name VARCHAR2(256) NOT NULL,
    Wohnungs_ID NUMBER NOT NULL,
    CONSTRAINT FK_beinhaltet_Zusatzausstattung FOREIGN KEY (Name) REFERENCES Zusatzausstattung(Name),
    CONSTRAINT FK_beinhaltet_Ferienwohnung FOREIGN KEY (Wohnungs_ID) REFERENCES Ferienwohnung(Wohnungs_ID) ON DELETE CASCADE,
    PRIMARY KEY(Name, Wohnungs_ID)
);

COMMENT ON COLUMN beinhaltet.WOHNUNGS_ID IS 
'FK auf Ferienwohnung mit ON DELETE CASCADE: Wird eine Ferienwohnung gelöscht, werden alle zugeordneten Zusatzausstattungen mit gelöscht.';

-- Tabelle entfernt
CREATE TABLE entfernt (
    Start_ID NUMBER NOT NULL,
    Ziel_ID NUMBER NOT NULL,
    km_Anzahl NUMBER NOT NULL CHECK (km_Anzahl > 0),
    CONSTRAINT FK_Start_Ort FOREIGN KEY (Start_ID) REFERENCES Ort(Ort_ID),
    CONSTRAINT FK_Ziel_Ort FOREIGN KEY (Ziel_ID) REFERENCES Ort(Ort_ID),
    CONSTRAINT CHK_Distanz_NichtGleich CHECK (Start_ID <> Ziel_ID),
    PRIMARY KEY(Start_ID, Ziel_ID, km_Anzahl)
);

COMMENT ON TABLE entfernt IS 'Die Entfernung zwischen zwei Orten wird höchstens einmal gespeichert und ist symmetrisch';

-- Tabelle umfasst
CREATE TABLE umfasst (
    Name VARCHAR2(256) NOT NULL,
    Startflughafen_ID CHAR(3) NOT NULL,
    Zielflughafen_ID CHAR(3) NOT NULL,
    CONSTRAINT FK_fliegt_Fluggesellschaften FOREIGN KEY (Name) REFERENCES Fluggesellschaften(Name),
    CONSTRAINT FK_fliegt_Start FOREIGN KEY (Startflughafen_ID) REFERENCES Flughafen(IATA_Code),
    CONSTRAINT FK_fliegt_Ziel FOREIGN KEY (Zielflughafen_ID) REFERENCES Flughafen(IATA_Code),
    CONSTRAINT CHK_fliegt_NichtGleich CHECK (Startflughafen_ID <> Zielflughafen_ID),
    PRIMARY KEY(Name, Startflughafen_ID, Zielflughafen_ID)
);

CREATE TABLE Stornierte_Buchung (
    StornierungsNr NUMBER PRIMARY KEY,
    Stornierungsdatum DATE DEFAULT SYSDATE NOT NULL,
    BuchungsNr NUMBER NOT NULL UNIQUE,
    Buchungsdatum DATE NOT NULL,
    Von DATE NOT NULL,
    Bis DATE NOT NULL,
    Buchungswert NUMBER(10,2) NOT NULL,
    Status VARCHAR2(10) NOT NULL CHECK (Status IN ('bezahlt', 'offen')),
    Kundennummer NUMBER NOT NULL,
    Kundenname VARCHAR2(100) NOT NULL,
    Telefonnummer VARCHAR2(20) NOT NULL,
    Wohnungs_ID NUMBER NOT NULL,
    Beschreibung VARCHAR2(250) NOT NULL
);

-- 2. Sequence für Stornierungsnummer
CREATE SEQUENCE seq_stornierungsnummer
    START WITH 100
    INCREMENT BY 2
    NOCACHE
    NOCYCLE;

--3. Preis Funktion
CREATE OR REPLACE FUNCTION preis (
    von_in DATE,
    bis_in DATE,
    wohnungs_id_in NUMBER
) RETURN NUMBER IS
    tagespreis NUMBER;
BEGIN
    SELECT Preis INTO tagespreis
    FROM Ferienwohnung
    WHERE Wohnungs_ID = wohnungs_id_in;

    RETURN (bis_in - von_in) * tagespreis;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN null;
END;
/
CREATE SEQUENCE AdresseSeq START WITH 20112 INCREMENT BY 1;
CREATE SEQUENCE KundeSeq START WITH 7 INCREMENT BY 1;
CREATE SEQUENCE BelegungSeq START WITH 50011 INCREMENT BY 1;


-- Test, um zu schauen, ob Funktion überhaupt funktioniert: SELECT preis ('2011-11-11', '2011-11-13', 66666) FROM dual;
--Views
-- 1. Sicht "Buchung", kommentare in create hinzufügen
CREATE VIEW Buchung AS
SELECT Belegungsnummer,
       Kundennummer,
       Wohnungs_ID,
       Von,
       Bis
FROM Belegungen
WHERE LOWER(Status) = 'gebucht';

--Buchung', 'Diese Sicht enthält alle gebuchten Belegungen ohne den Belegungsstatus und ist aktualisierbar.


--  Sicht "Reservierung"
CREATE VIEW Reservierung AS
SELECT Belegungsnummer,
       Kundennummer,
       Wohnungs_ID,
       Von,
       Bis
FROM Belegungen
WHERE LOWER(Status) = 'reserviert';

--Reservierung', 'Diese Sicht enthält alle reservierten Belegungen ohne den Belegungsstatus und ist aktualisierbar.

--2. „Familienwohnungen“

CREATE VIEW Familienwohnungen AS
SELECT *
FROM Ferienwohnung
WHERE Groesse_in_qm > 100
WITH CHECK OPTION;

--Familienwohnungen', 'Diese Sicht zeigt alle Ferienwohnungen mit mehr als 100 qm und ist aktualisierbar. Änderungen an der Wohnfläche sind nur erlaubt, wenn sie in der Sicht verbleiben, und Einfügungen sind nur für Wohnungen mit mehr als 100 qm zulässig.
-- Testen der Aktualisierbarkeit
-- Einfügen, Ändern und Löschen von Daten in der Sicht sollten nur für Wohnungen mit mehr als 100 qm möglich sein.

-- 3. „ÜbersichtKunden“

CREATE VIEW UebersichtKunden AS
SELECT k.Kundennummer,
       k.Nachname,
       k.Vorname,
       k.Adresse_ID,
       k.IBAN,
       b.Status AS Belegungsstatus,
       b.Von AS BuchungsVon,
       b.Bis AS BuchungsBis,
       b.Datum,
       f.Wohnungs_ID,
       f.Beschreibung
FROM Kunde k
JOIN Belegungen b ON k.Kundennummer = b.Kundennummer
JOIN Ferienwohnung f ON b.Wohnungs_ID = f.Wohnungs_ID
WITH READ ONLY;

--Diese Sicht enthält alle wichtigen Kundendaten, Buchungen und Reservierungen sowie Ferienwohnungsdetails und ist aktualisierbar.

--4. Sicht „Zalungstatus“

CREATE VIEW Zahlungstatus AS
SELECT b.Belegungsnummer,
       f.Wohnungs_ID,
       f.Beschreibung,
       k.Kundennummer,
       k.Nachname,
       k.Vorname,
       r.Rechnungsnummer,
       r.Rechnungsdatum AS Rechnungsdatum,
       r.Betrag AS Rechnungsbetrag,
       CASE 
           WHEN r.Zahlungseingangsdatum IS NOT NULL THEN 'bezahlt'
           ELSE 'offen'
       END AS Zahlungstatus,
       r.Zahlungseingangsdatum
FROM Belegungen b
JOIN Ferienwohnung f ON b.Wohnungs_ID = f.Wohnungs_ID
JOIN Kunde k ON b.Kundennummer = k.Kundennummer
JOIN Rechnung r ON b.Belegungsnummer = r.Belegungsnummer;

--Diese Sicht zeigt Buchungen, Rechnungen und den Zahlungsstatus und ist aktualisierbar.'

--5. Sicht MidAgeKunden
CREATE VIEW MidAgeKunden AS
SELECT 
  k.kundennummer,
  k.vorname,
  k.nachname,
  k.geburtsdatum,
  k.e_mail,
  k.telefonnummer,
  k.adresse_id,
  k.iban,
  FLOOR(MONTHS_BETWEEN(SYSDATE, k.geburtsdatum) / 12) AS alter_jahre
FROM Kunde k
WHERE FLOOR(MONTHS_BETWEEN(SYSDATE, k.geburtsdatum) / 12) BETWEEN 30 AND 40;

--Diese Sicht enthält Kunden im Alter von 30 bis 40 Jahren und ist aktualisierbar.

--6. Sicht GuteFluggesellschaften
CREATE OR REPLACE VIEW GuteFluggesellschaften AS
SELECT fg.Name
FROM Fluggesellschaften fg
WHERE fg.Qualität > 5
WITH CHECK OPTION;

--Diese Sicht enthält Fluggesellschaften mit einer Qualität größer als 5 und ist nicht aktualisierbar.