ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';

-- Länder
INSERT INTO Land (ISO_code, Name) VALUES ('DEU', 'Deutschland');
INSERT INTO Land (ISO_code, Name) VALUES ('CHE', 'Schweiz');
INSERT INTO Land (ISO_code, Name) VALUES ('ESP', 'Spanien');
INSERT INTO Land (ISO_code, Name) VALUES ('TUR', 'Türkei');
INSERT INTO Land (ISO_code, Name) VALUES ('FRA', 'Frankreich');
INSERT INTO Land (ISO_code, Name) VALUES ('GRL', 'Grönland');

-- Orte
INSERT INTO Ort (Ort_ID, Name, ISO_Code, EntfernungFlughafen, Flughafen_ID) VALUES(10001,'Konstanz','DEU',150,'FRA'); 
INSERT INTO Ort (Ort_ID, Name, ISO_Code, EntfernungFlughafen, Flughafen_ID) VALUES(10002,'Stuttgart','DEU',30,'FRA');
INSERT INTO Ort (Ort_ID, Name, ISO_Code, EntfernungFlughafen, Flughafen_ID) VALUES(10003,'Heidelberg','DEU',40,'FRA');
INSERT INTO Ort (Ort_ID, Name, ISO_Code, EntfernungFlughafen, Flughafen_ID) VALUES(10004,'Bern','CHE',40,'ZRH');
INSERT INTO Ort (Ort_ID, Name, ISO_Code, EntfernungFlughafen, Flughafen_ID) VALUES(10005,'Zuerich','CHE',5,'ZRH'); 
INSERT INTO Ort (Ort_ID, Name, ISO_Code, EntfernungFlughafen, Flughafen_ID) VALUES(10006,'Rust','DEU',65,'FRA');
INSERT INTO Ort (Ort_ID, Name, ISO_Code, EntfernungFlughafen, Flughafen_ID) VALUES(10007,'Chur','CHE',25,'ZRH'); 
INSERT INTO Ort (Ort_ID, Name, ISO_Code, EntfernungFlughafen, Flughafen_ID) VALUES(10008,'Flims-Laax','CHE',100,'ZRH'); 
INSERT INTO Ort (Ort_ID, Name, ISO_Code, EntfernungFlughafen, Flughafen_ID) VALUES(10009,'Oeludeniz','TUR',150,'IST'); 
INSERT INTO Ort (Ort_ID, Name, ISO_Code, EntfernungFlughafen, Flughafen_ID) VALUES(10010,'Antalya','TUR',160,'IST'); 
INSERT INTO Ort (Ort_ID, Name, ISO_Code, EntfernungFlughafen, Flughafen_ID) VALUES(10011,'Bordeaux','FRA',50,'CDG');
INSERT INTO Ort (Ort_ID, Name, ISO_Code, EntfernungFlughafen, Flughafen_ID) VALUES(10012,'Paris','FRA',5,'CDG'); 
INSERT INTO Ort (Ort_ID, Name, ISO_Code, EntfernungFlughafen, Flughafen_ID) VALUES(20105,'Disneyland','FRA',60,'CDG'); 
INSERT INTO Ort (Ort_ID, Name, ISO_Code, EntfernungFlughafen, Flughafen_ID) VALUES(10014,'Barcelona','ESP',5,'BCN'); 
INSERT INTO Ort (Ort_ID, Name, ISO_Code, EntfernungFlughafen, Flughafen_ID) VALUES(10015,'Frankfurt','DEU',5,'FRA'); 
INSERT INTO Ort (Ort_ID, Name, ISO_Code, EntfernungFlughafen, Flughafen_ID) VALUES(10016,'Istanbul','TUR',50,'IST');

-- Adressen
INSERT INTO Adresse (Adresse_ID, PLZ, Strasse, Hausnummer, Ort_ID) VALUES (20001, '78647', 'Reutestr.', '104 B', 10001);
INSERT INTO Adresse (Adresse_ID, PLZ, Strasse, Hausnummer, Ort_ID) VALUES (20002, '69115', 'Hauptstr.', '12', 10002);
INSERT INTO Adresse (Adresse_ID, PLZ, Strasse, Hausnummer, Ort_ID) VALUES (20003, '70173', 'Schlossstr.', '54',10003);
INSERT INTO Adresse (Adresse_ID, PLZ, Strasse, Hausnummer, Ort_ID) VALUES (20004, '3001', 'Alpenstr.', '11 A', 10004);
INSERT INTO Adresse (Adresse_ID, PLZ, Strasse, Hausnummer, Ort_ID) VALUES (20005, '8001', 'Seeweg', '23', 10005);
INSERT INTO Adresse (Adresse_ID, PLZ, Strasse, Hausnummer, Ort_ID) VALUES (20006,'78462','Rheingutstr','14',10001);

INSERT INTO Adresse (Adresse_ID, PLZ, Strasse, Hausnummer, Ort_ID) VALUES (20101,'78231','Europapark','1',10006);
INSERT INTO Adresse (Adresse_ID, PLZ, Strasse, Hausnummer, Ort_ID) VALUES (20102,'78463','Seestr','12',10001);
INSERT INTO Adresse (Adresse_ID, PLZ, Strasse, Hausnummer, Ort_ID) VALUES (20103,'2371','Bergweg','78',10008);
INSERT INTO Adresse (Adresse_ID, PLZ, Strasse, Hausnummer, Ort_ID) VALUES (20104,'1352','GreenOne','29',10005);
INSERT INTO Adresse (Adresse_ID, PLZ, Strasse, Hausnummer, Ort_ID) VALUES (20105,'8787','rue de gaulle','22',20105);

INSERT INTO Adresse (Adresse_ID, PLZ, Strasse, Hausnummer, Ort_ID) VALUES (20201,'60541','Am Flughafen','2',10015);
INSERT INTO Adresse (Adresse_ID, PLZ, Strasse, Hausnummer, Ort_ID) VALUES (20202,'1452','Sabiha Gökcen','1',10016);
INSERT INTO Adresse (Adresse_ID, PLZ, Strasse, Hausnummer, Ort_ID) VALUES (20203,'5098','Flughafen-Allee','100',10005);
INSERT INTO Adresse (Adresse_ID, PLZ, Strasse, Hausnummer, Ort_ID) VALUES (20204,'8792','Charles de Gaulle','1',20105);
INSERT INTO Adresse (Adresse_ID, PLZ, Strasse, Hausnummer, Ort_ID) VALUES (20205,'08820','Aeropuerto de Barcelona','10',10014);

INSERT INTO Adresse (Adresse_ID, PLZ, Strasse, Hausnummer, Ort_ID) VALUES (20301,'2349','Highway','5',10009);
INSERT INTO Adresse (Adresse_ID, PLZ, Strasse, Hausnummer, Ort_ID) VALUES (20302,'78461','Markgrafenstr','33',10001);
INSERT INTO Adresse (Adresse_ID, PLZ, Strasse, Hausnummer, Ort_ID) VALUES (20303,'2234','Zur Piste','189',10007);
INSERT INTO Adresse (Adresse_ID, PLZ, Strasse, Hausnummer, Ort_ID) VALUES (20304,'8234','rue Monsieur','980',10011);
INSERT INTO Adresse (Adresse_ID, PLZ, Strasse, Hausnummer, Ort_ID) VALUES (20305,'8787','rue de gaulle','22',20105);
INSERT INTO Adresse (Adresse_ID, PLZ, Strasse, Hausnummer, Ort_ID) VALUES (20306,'8792','rue de la Maison Blanche','32',10012);
INSERT INTO Adresse (Adresse_ID, PLZ, Strasse, Hausnummer, Ort_ID) VALUES (20307,'8792','rue liberte','78',10012);
INSERT INTO Adresse (Adresse_ID, PLZ, Strasse, Hausnummer, Ort_ID) VALUES (20308,'2321','Strandweg','90',10010);
INSERT INTO Adresse (Adresse_ID, PLZ, Strasse, Hausnummer, Ort_ID) VALUES (20309,'2321','Strandweg','91',10010);
INSERT INTO Adresse (Adresse_ID, PLZ, Strasse, Hausnummer, Ort_ID) VALUES (20310,'2321','Strandweg','45',10010);
INSERT INTO Adresse (Adresse_ID, PLZ, Strasse, Hausnummer, Ort_ID) VALUES (20311,'5221','Calle del torro','821',10014);

-- Flughafen 
INSERT INTO Flughafen (IATA_Code, Name, Adresse_ID) VALUES ('FRA','Frankfurt', 20201);
INSERT INTO Flughafen (IATA_Code, Name, Adresse_ID) VALUES ('IST', 'Istanbul', 20202);
INSERT INTO Flughafen (IATA_Code, Name, Adresse_ID) VALUES ('ZRH','Zuerich',20203);
INSERT INTO Flughafen (IATA_Code, Name, Adresse_ID) VALUES ('CDG','Paris',20204);
INSERT INTO Flughafen (IATA_Code, Name, Adresse_ID) VALUES ('BCN','Barcelona',20205);


-- Fluggesellschaft
INSERT INTO Fluggesellschaften (IATA_Code, Name, Qualität) VALUES ('LH','Lufthansa',1); 
INSERT INTO Fluggesellschaften (IATA_Code, Name, Qualität) VALUES ('4U','German Wings',4);
INSERT INTO Fluggesellschaften (IATA_Code, Name, Qualität) VALUES ('TC','Thomas Cook',8);
INSERT INTO Fluggesellschaften (IATA_Code, Name, Qualität) VALUES ('HLX','Hapag Lloyd',9);
INSERT INTO Fluggesellschaften (IATA_Code, Name, Qualität) VALUES ('SW', 'Swiss',2);
INSERT INTO Fluggesellschaften (IATA_Code, Name, Qualität) VALUES ('PDJ', 'PDJWAirs',1);


-- Bankverbindungen
INSERT INTO Bankverbindung (IBAN, BLZ, BIC, Kontonummer, Kundennummer) VALUES ('DE85692717230007823212','KARSDE66XXX','69271723','7823212', 1 );
INSERT INTO Bankverbindung (IBAN, BLZ, BIC, Kontonummer, Kundennummer) VALUES ('DE83692717230008929368','BARSDE77XXX','32793968','8929368', 2);
INSERT INTO Bankverbindung (IBAN, BLZ, BIC, Kontonummer, Kundennummer) VALUES ('DE85692717230001347291','KARSDE66XXX','69271723','1347291', 3);
INSERT INTO Bankverbindung (IBAN, BLZ, BIC, Kontonummer, Kundennummer) VALUES('CH85692717230008792978','MEMECH88XXX','29788431','8792978', 4);
INSERT INTO Bankverbindung (IBAN, BLZ, BIC, Kontonummer, Kundennummer) VALUES ('CH85692717230009082780','KONSCH12XXX','87890271','9082780', 5);
INSERT INTO Bankverbindung (IBAN, BLZ, BIC, Kontonummer, Kundennummer) VALUES ('CH85692717230009082790','KARSDE66XXX','69271723','7322890', 6);

-- Kunden
INSERT INTO Kunde (Kundennummer, Nachname, Vorname, E_Mail, Telefonnummer, Geburtsdatum, IBAN, Adresse_ID) VALUES
  (1, 'Napf', 'Karl', 'knapf@gmx.de', '07531-123456', '1960-01-01', 'DE85692717230007823212', 20001);
INSERT INTO Kunde (Kundennummer, Nachname, Vorname,  E_Mail,  Telefonnummer, Geburtsdatum, IBAN, Adresse_ID) VALUES
  (2, 'HMeier', 'Hans', 'meiers.hans@t-online.de', '06221-999888', '1975-01-02', 'DE83692717230008929368', 20002);
INSERT INTO Kunde (Kundennummer, Nachname, Vorname,  E_Mail,  Telefonnummer, Geburtsdatum, IBAN, Adresse_ID) VALUES
  (3, 'Huber', 'Franz', 'huber@t-online.de','0711-554673', '1980-01-03', 'DE85692717230001347291', 20003);
INSERT INTO Kunde (Kundennummer, Nachname, Vorname,  E_Mail,  Telefonnummer, Geburtsdatum, IBAN, Adresse_ID) VALUES
  (4, 'Eber', 'Klaus', 'eber@bluewin.ch', '+41-171-9864785', '1985-01-04', 'CH85692717230008792978', 20004);
INSERT INTO Kunde (Kundennummer, Nachname, Vorname,  E_Mail,  Telefonnummer, Geburtsdatum, IBAN, Adresse_ID) VALUES
  (5, 'Meier', 'Egon', 'meier@gmail. com', '+41-171-9864786', '1990-01-05', 'CH85692717230009082780', 20005);
INSERT INTO Kunde (Kundennummer, Nachname, Vorname,  E_Mail,  Telefonnummer, Geburtsdatum, IBAN, Adresse_ID) VALUES
  (6, 'Knopf', 'Jim', 'jim.knopf@gmx.net', '0171-9876543', '1995-01-06', 'CH85692717230009082790', 20006);



-- Zusatzausstattung
INSERT INTO Zusatzausstattung (Name) VALUES ('Schwimmbad');
INSERT INTO Zusatzausstattung(Name) VALUES ('Sauna');
INSERT INTO Zusatzausstattung (Name) VALUES ('Autoabstellplatz');
INSERT INTO Zusatzausstattung (Name) VALUES ('Aufzug');
INSERT INTO Zusatzausstattung (Name) VALUES ('Kinderbetreuung');
INSERT INTO Zusatzausstattung (Name) VALUES ('Sat-TV');
INSERT INTO Zusatzausstattung (Name) VALUES ('Reinigung');
INSERT INTO Zusatzausstattung (Name) VALUES ('Dachterrasse');
INSERT INTO Zusatzausstattung (Name) VALUES ('Garage');

-- Ferienwohnung 
INSERT INTO Ferienwohnung (Wohnungs_ID, Beschreibung, Anzahl_der_Zimmer, Groesse_in_qm, Preis, Adresse_ID) VALUES (30001,'Finka',6,200,349.00,20301);
INSERT INTO Ferienwohnung (Wohnungs_ID, Beschreibung, Anzahl_der_Zimmer, Groesse_in_qm, Preis, Adresse_ID) VALUES (30002,'Ferienwohnung mit Seeblick',2,45,120.00,20302);
INSERT INTO Ferienwohnung (Wohnungs_ID, Beschreibung, Anzahl_der_Zimmer, Groesse_in_qm, Preis, Adresse_ID) VALUES (30003,'im Schnee',3,150,249.00,20303);
INSERT INTO Ferienwohnung (Wohnungs_ID, Beschreibung, Anzahl_der_Zimmer, Groesse_in_qm, Preis, Adresse_ID) VALUES (30004,'direkt am Meer',4,100,249.00,20304);
INSERT INTO Ferienwohnung (Wohnungs_ID, Beschreibung, Anzahl_der_Zimmer, Groesse_in_qm, Preis, Adresse_ID) VALUES (30005,'direkt am Park',3,110,289.00,20305);
INSERT INTO Ferienwohnung (Wohnungs_ID, Beschreibung, Anzahl_der_Zimmer, Groesse_in_qm, Preis, Adresse_ID) VALUES (30006,'mit Blick auf Eiffelturm',2,70,549.00,20306);
INSERT INTO Ferienwohnung (Wohnungs_ID, Beschreibung, Anzahl_der_Zimmer, Groesse_in_qm, Preis, Adresse_ID) VALUES (30007,'Dachterrassewohnung zentral',6,110,159.00,20307);
INSERT INTO Ferienwohnung (Wohnungs_ID, Beschreibung, Anzahl_der_Zimmer, Groesse_in_qm, Preis, Adresse_ID) VALUES (30008,'zweigeschoessiges Haus',12,200,240.00,20308);
INSERT INTO Ferienwohnung (Wohnungs_ID, Beschreibung, Anzahl_der_Zimmer, Groesse_in_qm, Preis, Adresse_ID) VALUES (30009,'Topvilla am Strand',5,111,159.00,20309);
INSERT INTO Ferienwohnung (Wohnungs_ID, Beschreibung, Anzahl_der_Zimmer, Groesse_in_qm, Preis, Adresse_ID) VALUES (30010,'Ferienhaus am Strand',4,100,299.00,20310);
INSERT INTO Ferienwohnung (Wohnungs_ID, Beschreibung, Anzahl_der_Zimmer, Groesse_in_qm, Preis, Adresse_ID) VALUES (30011,'Strandbungalow',4,100,150.00,20311);

-- Bild
INSERT INTO Bild (Bild_ID, Beschreibung, Dateipfad, Wohnungs_ID) VALUES (4001,'Aussenansicht','1_1.jpg', 30001);
INSERT INTO Bild (Bild_ID, Beschreibung, Dateipfad, Wohnungs_ID) VALUES (4002,'Innenansicht','1_2.jpg', 30001);
INSERT INTO Bild (Bild_ID, Beschreibung, Dateipfad, Wohnungs_ID) VALUES (4003,'Aussenansicht','2_1.jpg', 30002);
INSERT INTO Bild (Bild_ID, Beschreibung, Dateipfad, Wohnungs_ID) VALUES (4004,'Innenansicht','2_2.jpg', 30002);
--INSERT INTO Bild (Bild_ID, Beschreibung, Dateipfad, Wohnungs_ID) VALUES (4005,Null,Null, 30003);
--INSERT INTO Bild (Bild_ID, Beschreibung, Dateipfad, Wohnungs_ID) VALUES (4006,Null,Null, 30004);
INSERT INTO Bild (Bild_ID, Beschreibung, Dateipfad, Wohnungs_ID) VALUES (4006,'Garage','5_1.gif', 30005);
--INSERT INTO Bild (Bild_ID, Beschreibung, Dateipfad, Wohnungs_ID) VALUES (4008,Null,Null, 30006);
--INSERT INTO Bild (Bild_ID, Beschreibung, Dateipfad, Wohnungs_ID) VALUES (4009,Null,Null, 30007);
INSERT INTO Bild (Bild_ID, Beschreibung, Dateipfad, Wohnungs_ID) VALUES (4010,'Dachterrasse','8.jpg', 30008);
--INSERT INTO Bild (Bild_ID, Beschreibung, Dateipfad, Wohnungs_ID) VALUES (4011,Null,Null, 30009);
--INSERT INTO Bild (Bild_ID, Beschreibung, Dateipfad, Wohnungs_ID) VALUES (4012,Null,Null, 30010);
--INSERT INTO Bild (Bild_ID, Beschreibung, Dateipfad, Wohnungs_ID) VALUES (4013,Null,Null, 30011);

-- beinhaltet
INSERT INTO beinhaltet (Name, Wohnungs_ID) VALUES ('Schwimmbad', 30001);
INSERT INTO beinhaltet (Name, Wohnungs_ID) VALUES ('Sauna', 30001);
INSERT INTO beinhaltet (Name, Wohnungs_ID) VALUES ('Autoabstellplatz', 30002);
INSERT INTO beinhaltet (Name, Wohnungs_ID) VALUES ('Aufzug', 30002);
INSERT INTO beinhaltet (Name, Wohnungs_ID) VALUES ('Sauna', 30003);
INSERT INTO beinhaltet (Name, Wohnungs_ID) VALUES ('Kinderbetreuung', 30005);
INSERT INTO beinhaltet (Name, Wohnungs_ID) VALUES ('Schwimmbad', 30005);
INSERT INTO beinhaltet (Name, Wohnungs_ID) VALUES ('Schwimmbad', 30006);
INSERT INTO beinhaltet (Name, Wohnungs_ID) VALUES ('Schwimmbad', 30007);
INSERT INTO beinhaltet (Name, Wohnungs_ID) VALUES ('Sat-TV', 30008);
INSERT INTO beinhaltet (Name, Wohnungs_ID) VALUES ('Reinigung', 30008);
INSERT INTO beinhaltet (Name, Wohnungs_ID) VALUES ('Dachterrasse', 30008);
INSERT INTO beinhaltet (Name, Wohnungs_ID) VALUES ('Garage', 30009);
INSERT INTO beinhaltet (Name, Wohnungs_ID) VALUES ('Schwimmbad', 30009);
INSERT INTO beinhaltet (Name, Wohnungs_ID) VALUES ('Schwimmbad', 30010);


--Belegungen
INSERT INTO Belegungen (Belegungsnummer,Datum, Von, Bis, Status, Wohnungs_ID, Kundennummer) VALUES(50001,'2016-02-11','2016-03-12','2016-03-13','Gebucht',30004,2);
INSERT INTO Belegungen (Belegungsnummer,Datum, Von, Bis, Status, Wohnungs_ID, Kundennummer) VALUES(50002,'2016-03-11','2016-05-13','2016-05-17','Reserviert',30005,2);
INSERT INTO Belegungen (Belegungsnummer,Datum, Von, Bis, Status, Wohnungs_ID, Kundennummer) VALUES(50003,'2016-02-10', '2016-04-03','2016-04-23','Reserviert',30005,3);
INSERT INTO Belegungen (Belegungsnummer,Datum, Von, Bis, Status, Wohnungs_ID, Kundennummer) VALUES(50004,'2016-02-09', '2016-07-04','2016-07-05','Gebucht',30006,4);
INSERT INTO Belegungen (Belegungsnummer,Datum, Von, Bis, Status, Wohnungs_ID, Kundennummer) VALUES(50005,'2016-02-14', '2016-04-28','2016-05-02','Reserviert',30010,2);
INSERT INTO Belegungen (Belegungsnummer,Datum, Von, Bis, Status, Wohnungs_ID, Kundennummer) VALUES(50006,'2016-02-18','2016-05-04','2016-05-22','Gebucht',30008,3);
INSERT INTO Belegungen (Belegungsnummer,Datum, Von, Bis, Status, Wohnungs_ID, Kundennummer) VALUES(50007,'2016-02-01','2016-05-07','2016-05-08','Gebucht',30002,1);
INSERT INTO Belegungen (Belegungsnummer,Datum, Von, Bis, Status, Wohnungs_ID, Kundennummer) VALUES(50008,'2016-02-11','2016-05-22','2016-05-28','Gebucht',30009,5);
INSERT INTO Belegungen (Belegungsnummer,Datum, Von, Bis, Status, Wohnungs_ID, Kundennummer) VALUES(50009,'2016-02-07','2016-07-03','2016-07-08','Gebucht',30010,5);
INSERT INTO Belegungen (Belegungsnummer,Datum, Von, Bis, Status, Wohnungs_ID, Kundennummer) VALUES(50010,'2016-02-10', '2016-05-01','2016-05-24', 'Reserviert',30001,4);

-- Rechnung 
INSERT INTO Rechnung (Rechnungsnummer, Zahlungseingangsdatum, Rechnungsdatum, Betrag, Belegungsnummer) VALUES (1,'2016-03-18','2016-03-15', 498.00, 50001);
INSERT INTO Rechnung (Rechnungsnummer, Zahlungseingangsdatum, Rechnungsdatum, Betrag, Belegungsnummer) VALUES (2, NULL, '2016-02-26', 549.00, 50004);

-- Touristenattraktion 
INSERT INTO Touristenattraktion (Name, Beschreibung, Adresse_ID) VALUES ('Europapark','Freizeitpark', 20101);
INSERT INTO Touristenattraktion (Name, Beschreibung, Adresse_ID) VALUES ('Hoernle','Badestrand', 20102);
INSERT INTO Touristenattraktion (Name, Beschreibung, Adresse_ID) VALUES ('Flims-Laax Arena','Skigebiet', 20103);
INSERT INTO Touristenattraktion (Name, Beschreibung, Adresse_ID) VALUES ('GreenOne','Golfplatz', 20104);
INSERT INTO Touristenattraktion (Name, Beschreibung, Adresse_ID) VALUES ('Disneyland','Freizeitpark', 20105);

-- umfasst
INSERT INTO umfasst (Name, Startflughafen_ID, Zielflughafen_ID) VALUES ('Lufthansa','FRA','BCN');
INSERT INTO umfasst (Name, Startflughafen_ID, Zielflughafen_ID) VALUES('German Wings','FRA','IST');
INSERT INTO umfasst (Name, Startflughafen_ID, Zielflughafen_ID) VALUES('German Wings','FRA','CDG');
INSERT INTO umfasst (Name, Startflughafen_ID, Zielflughafen_ID) VALUES('Lufthansa','FRA','CDG');
INSERT INTO umfasst (Name, Startflughafen_ID, Zielflughafen_ID) VALUES('Thomas Cook','FRA','CDG');
INSERT INTO umfasst (Name, Startflughafen_ID, Zielflughafen_ID) VALUES('Thomas Cook', 'IST','BCN');
INSERT INTO umfasst (Name, Startflughafen_ID, Zielflughafen_ID) VALUES('Hapag Lloyd', 'CDG','BCN');
INSERT INTO umfasst (Name, Startflughafen_ID, Zielflughafen_ID) VALUES('German Wings','CDG','ZRH');
INSERT INTO umfasst (Name, Startflughafen_ID, Zielflughafen_ID) VALUES('PDJWAirs','FRA','CDG');
INSERT INTO umfasst (Name, Startflughafen_ID, Zielflughafen_ID) VALUES('PDJWAirs','CDG','BCN');
INSERT INTO umfasst (Name, Startflughafen_ID, Zielflughafen_ID) VALUES('PDJWAirs','BCN','CDG');

-- entfernt
INSERT INTO entfernt(Start_ID, Ziel_ID, km_Anzahl) VALUES (10002,10004,'180');
INSERT INTO entfernt(Start_ID, Ziel_ID, km_Anzahl) VALUES (10002,10012,'120');
INSERT INTO entfernt(Start_ID, Ziel_ID, km_Anzahl) VALUES (10003,10016,'40');
INSERT INTO entfernt(Start_ID, Ziel_ID, km_Anzahl) VALUES (10003,10011,'40');
INSERT INTO entfernt(Start_ID, Ziel_ID, km_Anzahl) VALUES (10004,10008,'420');
INSERT INTO entfernt(Start_ID, Ziel_ID, km_Anzahl) VALUES (10005,10009,'10');
INSERT INTO entfernt(Start_ID, Ziel_ID, km_Anzahl) VALUES (10006,20105,'30');
INSERT INTO entfernt(Start_ID, Ziel_ID, km_Anzahl) VALUES (10007,20105 ,'30');

COMMIT;