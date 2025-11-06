CREATE OR REPLACE TRIGGER trg_storniere_buchung
BEFORE DELETE ON Belegungen
FOR EACH ROW
WHEN (old.Status = 'Gebucht')
DECLARE
    v_buchungswert     NUMBER;
    v_kundenname       VARCHAR2(100);
    v_telefonnummer    VARCHAR2(20);
    v_beschreibung     VARCHAR2(250);
    v_zahlungseingang  DATE;
BEGIN
        
        SELECT max(Zahlungseingangsdatum) INTO v_zahlungseingang
            FROM Rechnung
            WHERE Belegungsnummer = :OLD.Belegungsnummer;

        SELECT Vorname || ' ' || Nachname, Telefonnummer
        INTO v_kundenname, v_telefonnummer
        FROM Kunde
        WHERE Kundennummer = :OLD.Kundennummer;

        SELECT Beschreibung
        INTO v_beschreibung
        FROM Ferienwohnung
        WHERE Wohnungs_ID = :OLD.Wohnungs_ID;

        v_buchungswert := preis(:OLD.Von, :OLD.Bis, :OLD.Wohnungs_ID);

        INSERT INTO Stornierte_Buchung (
            StornierungsNr,
            Stornierungsdatum,
            BuchungsNr,
            Buchungsdatum,
            Von,
            Bis,
            Buchungswert,
            Status,
            Kundennummer,
            Kundenname,
            Telefonnummer,
            Wohnungs_ID,
            Beschreibung
        ) VALUES (
            seq_stornierungsnummer.NEXTVAL,
            SYSDATE,
            :OLD.Belegungsnummer,
            :OLD.Datum,
            :OLD.Von,
            :OLD.Bis,
            v_buchungswert,
            CASE WHEN v_zahlungseingang IS NULL THEN 'offen' ELSE 'bezahlt' END,
            :OLD.Kundennummer,
            v_kundenname,
            v_telefonnummer,
            :OLD.Wohnungs_ID,
            v_beschreibung
        );

        DELETE FROM Rechnung WHERE Belegungsnummer = :OLD.Belegungsnummer;
    END;
/

--show errors

--a) Reservierung (Status = 'gebucht', keine Rechnung vorhanden, soll gelöscht werden)
DELETE FROM Belegungen WHERE Belegungsnummer = 50002;

--b) Buchung ohne Rechnung
DELETE FROM Belegungen WHERE Belegungsnummer = 50006;

--c) Buchung mit unbezahlter Rechnung (Zahlungseingangsdatum IS NULL → "offen", soll gelöscht werden)
DELETE FROM Belegungen WHERE Belegungsnummer = 50004;

--d) Buchung mit bezahlter Rechnung (Zahlungseingangsdatum NOT NULL → "bezahlt", darf NICHT gelöscht werden)
DELETE FROM Belegungen WHERE Belegungsnummer = 50001;

ROLLBACK;
