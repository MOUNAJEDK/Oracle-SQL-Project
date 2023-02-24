--CREAREA TABELELOR: 
--------------------
--1)Crearea tabelei COMPANII 
CREATE TABLE companii 
( 
id_companie NUMBER(2) CONSTRAINT pkey_companie PRIMARY KEY, 
nume_companie VARCHAR2(40) NOT NULL, 
nume_ceo VARCHAR2(15) NOT NULL, 
prenume_ceo VARCHAR2(15) NOT NULL, 
adresa_sediu VARCHAR2(45) NOT NULL, 
cifra_afaceri NUMBER(13) NOT NULL 
);

--2)Crearea tabelei STUDIOURI 
CREATE TABLE studiouri 
( 
id_studio NUMBER(2) CONSTRAINT pkey_studio PRIMARY KEY, 
nume_studio VARCHAR(30) NOT NULL, 
data_fondare DATE NOT NULL, 
adresa_studio VARCHAR2(40) NOT NULL, 
nr_angajati NUMBER(3) NOT NULL, 
id_companie NUMBER(2), 
CONSTRAINT fkey_studio FOREIGN KEY (id_companie) REFERENCES companii(id_companie) 
);

--3)Crearea tabelei ROLURI
CREATE TABLE roluri 
( 
id_rol NUMBER(2) CONSTRAINT pkey_rol PRIMARY KEY, 
nume_rol VARCHAR2(45) NOT NULL, 
descriere_rol VARCHAR2(85) NOT NULL 
); 

--4)Crearea tabelei PLATFORME 
CREATE TABLE platforme
(
id_platforma NUMBER(2) CONSTRAINT pkey_platforma PRIMARY KEY,
nume_platforma VARCHAR2(20) NOT NULL
);

5)Crearea tabelei GENURI 
CREATE TABLE genuri
(
id_gen NUMBER(2) CONSTRAINT pkey_gen PRIMARY KEY,
descriere_gen VARCHAR2(30) NOT NULL
);

--6)Crearea tabelei SERII 
CREATE TABLE serii
(
id_serie NUMBER(2) CONSTRAINT pkey_serii PRIMARY KEY,
nume_serie VARCHAR2(30) NOT NULL
);

--7)Crearea tabelei JOCURI 
CREATE TABLE jocuri
(
id_joc NUMBER(2) CONSTRAINT pkey_joc PRIMARY KEY,
nume_titlu VARCHAR2(40) NOT NULL,
data_lansare DATE NOT NULL,
costuri_dezvoltare NUMBER(9) NOT NULL,
id_gen NUMBER(2),
CONSTRAINT fkey_joc_gen FOREIGN KEY (id_gen) REFERENCES genuri(id_gen),
id_serie NUMBER(2),
CONSTRAINT fkey_joc_serie FOREIGN KEY (id_serie) REFERENCES serii(id_serie)
);


--8)Crearea tabelei JOCURI_PLATFORME 
CREATE TABLE jocuri_platforme
(
id_joc NUMBER(2),
id_platforma NUMBER(2),
PRIMARY KEY(id_joc, id_platforma),
CONSTRAINT fk_jp_joc FOREIGN KEY (id_joc) REFERENCES jocuri(id_joc),
CONSTRAINT fk_jp_platforma FOREIGN KEY (id_platforma) REFERENCES 
platforme(id_platforma)
);


--9)Crearea tabelei SALARIATI 
CREATE TABLE salariati
(
id_salariat NUMBER(3) CONSTRAINT pkey_salariat PRIMARY KEY,
nume_salariat VARCHAR2(20) NOT NULL,
prenume_salariat VARCHAR2(20) NOT NULL,
salariul NUMBER(4) NOT NULL,
id_studio NUMBER(2),
CONSTRAINT fk_salariat_studio FOREIGN KEY (id_studio) REFERENCES studiouri(id_studio),
id_rol NUMBER(2),
CONSTRAINT fk_salariat_rol FOREIGN KEY (id_rol) REFERENCES roluri(id_rol),
id_joc NUMBER(2),
CONSTRAINT fk_salariat_joc FOREIGN KEY (id_joc) REFERENCES jocuri(id_joc)
);



--ACTUALIZAREA STRUCTURII TABELELOR SI MODIFICAREA RESTRICTIILOR DE INTEGRITATE: 
--------------------------------------------------------------------------------
--1)Sa se adauge coloana RANG in tabela COMPANII
ALTER TABLE companii 
ADD rang NUMBER(2);

--2)Sa se modifice tipul de data a coloanei RANG din tabela COMPANII 
ALTER TABLE companii 
MODIFY rang NUMBER(3); 

--3)Sa se stearga coloana RANG din tabela COMPANII 
ALTER TABLE companii 
DROP COLUMN rang; 

--4)Sa se schimbe numele tabelei COMAPANII in PUBLISHERI 
ALTER TABLE companii 
RENAME TO publisheri; 

--5)Sa se adauge restrictia de unicitate asupra coloanei NUME_COMPANIE din 
tabela PUBLISHERI 
ALTER TABLE publisheri 
ADD CONSTRAINT nume_publisheri_uq UNIQUE(nume_companie);

--6)Sa se dezactiveze restrictia de unicitate asupra coloanei NUME_COMPANIE din 
tabela PUBLISHERI 
ALTER TABLE publisheri 
DISABLE CONSTRAINT nume_publisheri_uq;

--7)Sa se stearga restrictia de unicitate asupra coloanei NUME_COMPANIE din 
tabela PUBLISHERI 
ALTER TABLE publisheri 
DROP CONSTRAINT nume_publisheri_uq;



--ADAUGAREA DE INREGISTARI IN FIECARE TABELA: 
---------------------------------------------
--1)Adaugarea unor noi inregistrari in tabela PUBLISHERI 
INSERT INTO publisheri 
VALUES (1, 'Andrew', 'Wilson', 'Redwood City, California, United States', 699000000000, 'Electronic Arts'); 
INSERT INTO publisheri 
VALUES (2, 'John', 'Kodera', 'San Mateo, California, United States', 2440000000000, 'Sony Interactive Entertainment'); 
INSERT INTO publisheri 
VALUES (3, 'Daniel', 'Algre', 'Santa Monica, California, United States', 803000000000, 'Activision Blizzard'); 
INSERT INTO publisheri 
VALUES (4, 'Shuntaro', 'Furukawa', 'Kyoto, Kyoto, Japan', 4800000000000, 'Nintendo');   
INSERT INTO publisheri 
VALUES (5, 'Karl', 'Slatoff', 'New York, New York, United States', 1000000000000, 'Take-Two Interactive'); 
INSERT INTO publisheri 
VALUES (6, 'Yves', 'Guillemot', 'Montreuil, France', 2125000000000, 'Ubisoft'); 
INSERT INTO publisheri 
VALUES (7, 'Kagemasa', 'Kozuki ', 'Chuo City, Tokyo, Japan', 262800000000, 'Konami'); 
INSERT INTO publisheri 
VALUES (8, 'Ma', 'Huateng', 'Shenzhen, China', 482100000000, 'Tencent'); 
INSERT INTO publisheri 
VALUES (9, 'Yosuke', 'Matsuda', 'Shinjuku City, Tokyo, Japan', 3653000000000, 'Square Enix');
INSERT INTO publisheri 
VALUES (10, 'Satya', 'Nadella', 'Redmond, Washington, United States', 1680000000000, 'Microsoft'); 

--2)Adaugarea unor noi inregistrari in tabela STUDIOURI 
INSERT INTO studiouri 
VALUES (1, 'Rockstar Games', TO_DATE('13-DEC-1998', 'DD-MON-YYYY'), 'New York City, New York, United States', 800, 5); 
INSERT INTO studiouri 
VALUES (2, '2K Games', TO_DATE('19-JAN-2005', 'DD-MON-YYYY'), 'Novato, California, United States', 600, 5); 
INSERT INTO studiouri 
VALUES (3, 'Eidos-Montreal', TO_DATE('28-NOV-2007', 'DD-MON-YYYY'), 'Montreal, Canada', 481, 9);
INSERT INTO studiouri 
VALUES (4, 'Ubisoft Montreal', TO_DATE('09-SEP-2000', 'DD-MON-YYYY'), 'Montreal, Canada', 500, 6); 
INSERT INTO studiouri 
VALUES (5, 'Ubisoft Toronto', TO_DATE('05-AUG-2006', 'DD-MON-YYYY'), 'Toronto, Canada', 350, 6); 
INSERT INTO studiouri 
VALUES (6, 'Bemani', TO_DATE('30-JAN-1997', 'DD-MON-YYYY'), ' Tokyo, Japan', 200, 7); 
INSERT INTO studiouri 
VALUES (7, 'Bluepoint Games', TO_DATE('24-MAR-2006', 'DD-MON-YYYY'), 'Austin, Texas, United States', 70, 2); 
INSERT INTO studiouri 
VALUES (8, 'Bungie', TO_DATE('04-JAN-1991', 'DD-MON-YYYY'), 'Bellevue, Washington, United States', 300, 3); 
INSERT INTO studiouri 
VALUES (9, '343 Industries', TO_DATE('18-JUL-2007', 'DD-MON-YYYY'), 'Redmond, Washington, United States', 450, 10); 
INSERT INTO studiouri 
VALUES (10, 'Obsidian Entertainment', TO_DATE('21-JUN-2003', 'DD-MON-YYYY'), 'Irvine, California, United States', 200, 10); 

--3)Adaugarea unor noi inregistrari in tabela ROLURI 
INSERT INTO roluri 
VALUES (1, 'Game Designer', 'Designerii de jocuri creeaz? jocuri, de la concept la design'); 
INSERT INTO roluri 
VALUES (2, 'Game Director', 'Directorii de jocuri sunt responsabili de toate aspectele unui joc'); 
INSERT INTO roluri 
VALUES (3, 'Game Programmer', 'Programatorii de jocuri creeaza jocuri, de la motorul de joc la jocul propriu-zis');
INSERT INTO roluri 
VALUES (4, 'Game Artist', 'Artistii de jocuri creeaza personaje, medii ?i efecte vizuale pentru jocuri'); 
INSERT INTO roluri 
VALUES (5, 'Game Writer', 'Scenaristii de jocuri creeaza povestea unui joc, de la concept la scriere'); 
INSERT INTO roluri 
VALUES (6, 'Game Tester', 'Testerii de jocuri gasesc erorile ?i problemele unui joc inainte de lansare'); 
INSERT INTO roluri 
VALUES (7, 'AI Game Programmer', 'Programatorii de jocuri AI creeaz? inteligenta artificiala 
pentru jocuri'); 
INSERT INTO roluri 
VALUES (8, 'Gameplay Animator', 'Animatorii de jocuri creeaza animatii pentru jocuri'); 
INSERT INTO roluri 
VALUES (9, 'FX Artist', 'Artistii de efecte vizuale creeaza efecte vizuale pentru jocuri'); 
INSERT INTO roluri 
VALUES (10, 'Asset Artist', 'Artistii de asseturi creeaza asseturi pentru jocuri');

--4)Adaugarea unor noi inregistrari in tabela PLATFORME 
INSERT INTO platforme 
VALUES(1, 'PlayStation 5'); 
INSERT INTO platforme 
VALUES(2, 'Xbox Series X'); 
INSERT INTO platforme 
VALUES(3, 'Nintendo Switch'); 
INSERT INTO platforme 
VALUES(4, 'PlayStation 4'); 
INSERT INTO platforme 
VALUES(5, 'Xbox One'); 
INSERT INTO platforme 
VALUES(6, 'PC'); 
INSERT INTO platforme 
VALUES(7, 'PlayStation 3'); 
INSERT INTO platforme 
VALUES(8, 'Xbox 360'); 
INSERT INTO platforme 
VALUES(9, 'Nintendo Wii'); 
INSERT INTO platforme 
VALUES(10, 'Nintendo DS'); 

--5)Adaugarea unor noi inregistrari in tabela GENURI 
INSERT INTO genuri 
VALUES(1, 'Action'); 
INSERT INTO genuri 
VALUES(2, 'Adventure'); 
INSERT INTO genuri 
VALUES(3, 'Role-playing'); 
INSERT INTO genuri 
VALUES(4, 'Simulation'); 
INSERT INTO genuri 
VALUES(5, 'Strategy'); 
INSERT INTO genuri 
VALUES(6, 'Sports'); 
INSERT INTO genuri 
VALUES(7, 'Racing'); 
INSERT INTO genuri 
VALUES(8, 'Puzzle'); 
INSERT INTO genuri 
VALUES(9, 'Fighting'); 
INSERT INTO genuri 
VALUES(10, 'Shooter'); 

--6)Adaugarea unor noi inregistrari in tabela SERII 
INSERT INTO serii 
VALUES(1, 'Grand Theft Auto'); 
INSERT INTO serii 
VALUES(2, 'Red Dead'); 
INSERT INTO serii 
VALUES(3, 'Halo'); 
INSERT INTO serii 
VALUES(4, 'Call of Duty'); 
INSERT INTO serii 
VALUES(5, 'FIFA'); 
INSERT INTO serii 
VALUES(6, 'Assassin''s Creed'); 
INSERT INTO serii 
VALUES(7, 'The Sims'); 
INSERT INTO serii 
VALUES(8, 'Need for Speed'); 
INSERT INTO serii 
VALUES(9, 'Metal Gear Solid'); 
INSERT INTO serii 
VALUES(10, 'Tomb Raider');

--7)Adaugarea unor noi inregistrari in tabela JOCURI 
INSERT INTO jocuri 
VALUES (1, 'Grand Theft Auto V', TO_DATE('27-SEP-2013', 'DD-MON-YYYY'), 230000000, 1, 1);
INSERT INTO jocuri
VALUES (2, 'Red Dead Redemption 2', TO_DATE('23-OCT-2018', 'DD-MON-YYYY'), 200000000, 
2, 1);
INSERT INTO jocuri 
VALUES (3, 'Halo 5: Guardians', TO_DATE('19-OCT-2015', 'DD-MON-YYYY'), 70000000, 10, 3);
INSERT INTO jocuri
VALUES (4, 'Call of Duty: Black Ops 4', TO_DATE('04-OCT-2018', 'DD-MON-YYYY'), 394000000, 
10, 4);
INSERT INTO jocuri
VALUES (5, 'FIFA 21', TO_DATE('10-OCT-2020', 'DD-MON-YYYY'), 357000000, 6, 5);
INSERT INTO jocuri
VALUES (6, 'Assassin''s Creed: Odyssey', TO_DATE('02-OCT-2018', 'DD-MON-YYYY'), 
238000000, 3, 6);
INSERT INTO jocuri
VALUES (7, 'The Sims 4', TO_DATE('09-SEP-2014', 'DD-MON-YYYY'), 123000000, 7, 7);
INSERT INTO jocuri
VALUES (8, 'Need for Speed: Heat', TO_DATE('10-NOV-2019', 'DD-MON-YYYY'), 237000000, 7, 
8);
INSERT INTO jocuri
VALUES (9, 'Metal Gear Solid 5: The Phantom''s Pain', TO_DATE('21-NOV-2011', 'DD-MONYYYY'), 568000000, 1, 9);
INSERT INTO jocuri
VALUES (10, 'Shadow of The Tomb Raider', TO_DATE('16-MAR-2013', 'DD-MON-YYYY'), 
129000000, 2, 10);

--8)Adaugarea unor noi inregistrari in tabela JOCURI_PLATFORME 
INSERT INTO jocuri_platforme 
VALUES (1, 1);
INSERT INTO jocuri_platforme
VALUES (1, 2);
INSERT INTO jocuri_platforme
VALUES (1, 3);
INSERT INTO jocuri_platforme
VALUES (2, 4);
INSERT INTO jocuri_platforme
VALUES (2, 5);
INSERT INTO jocuri_platforme 
VALUES (3, 6);
INSERT INTO jocuri_platforme
VALUES (4, 7);
INSERT INTO jocuri_platforme
VALUES (5, 8);
INSERT INTO jocuri_platforme
VALUES (5, 9);
INSERT INTO jocuri_platforme
VALUES (5, 10);

--9)Adaugarea unor noi inregistrari in tabela SALARIATI 
INSERT INTO salariati 
VALUES (1, 'Smith', 'John', 4500, 1, 1, 1);
INSERT INTO salariati
VALUES (2, 'Doe', 'Jane', 5000, 2, 2, 2);
INSERT INTO salariati
VALUES (3, 'Smith', 'Bob', 5500, 3, 3, 3);
INSERT INTO salariati
VALUES (4, 'Doe', 'Alice', 6000, 4, 4, 4);
INSERT INTO salariati
VALUES (5, 'Hank', 'Aaron', 6500, 5, 5, 5);
INSERT INTO salariati
VALUES (6, 'Abigail', 'Adams', 7000, 6, 6, 6);
INSERT INTO salariati
VALUES (7, 'James', 'Alfred', 7500, 7, 7, 7);
INSERT INTO salariati
VALUES (8, 'Baker', 'Robert', 8000, 8, 8, 8);
INSERT INTO salariati
VALUES (9, 'Mason', 'Michael', 8500, 9, 9, 9);
INSERT INTO salariati
VALUES (10, 'Hills', 'Richard', 9000, 10, 10, 10);

--ACTUALIZAREA INREGISTARILOR: 
------------------------------
--1)Sa se modifice costul de dezvoltare cu valoarea 250000000 al jocului cu id-ul 1 
UPDATE jocuri 
SET costuri_dezvoltare = 250000000
WHERE id_joc = 1; 

--2)Sa se stearga salariatul al carui nume este 'Smith' si prenumele este 'John' 
DELETE FROM salariati 
WHERE nume_salariat = 'Smith' AND prenume_salariat = 'John';

--STERGEREA SI RECUPERERAREA UNEI TABELE:
-----------------------------------------
--1)Sa se stearga tabela JOCURI_PLATFORME din baza de date, iar apoi sa se 
recupereze 
DROP TABLE jocuri_platforme; 
FLASHBACK TABLE jocuri_platforme TO BEFORE DROP; 

--EXEMPLE DE INTEROGARI VARIATE:
---------------------------------
--UNION:
--1)Sa se afiseze toate datele salariatilor al caror salariu nume este 'Doe' si datele 
salariatilor al caror nume incepe cu litera 'A' 
SELECT * 
FROM salariati 
WHERE nume_salariat = 'Doe' 
UNION 
SELECT * 
FROM salariati 
WHERE prenume_salariat LIKE 'A%';

--2)Sa se afiseze id-ul si numele jocului si, de asemenea, id-ul si prenumele 
salariatilor care au contribuit la acel joc 
SELECT id_joc, nume_titlu AS joc 
FROM jocuri 
UNION 
SELECT id_salariat, prenume_salariat 
FROM salariati;

--INTERSECT:
--1)Sa se afiseze numele, prenume si salariul salariatilor al caror salariu esti intre 
5000 si 8000 
SELECT nume_salariat, prenume_salariat, salariul 
FROM salariati 
INTERSECT 
SELECT nume_salariat, prenume_salariat, salariul 
FROM salariati 
WHERE salariul BETWEEN 5000 AND 8000;

--2)Sa se afiseze rolurile al caror nume incepe cu litera 'G' 
SELECT id_rol, nume_rol 
FROM roluri 
INTERSECT 
SELECT id_rol, nume_rol 
FROM roluri 
WHERE nume_rol LIKE 'G%';

--MINUS:
--1)Sa se afiseze salariatii al caror salariu este mai mare decat 5000
SELECT * 
FROM salariati 
MINUS 
SELECT * 
FROM salariati 
WHERE salariul < 5000; 

--2)Sa se afiseze id-ul si numele studiourilor al caror numar de angajati este intre 
100 si 900, fara cele care au numarul de angajati egal cu 500 si 600
SELECT id_studio, nume_studio, nr_angajati 
FROM studiouri 
WHERE nr_angajati between 100 AND 900 
MINUS 
SELECT id_studio, nume_studio, nr_angajati 
FROM studiouri 
WHERE nr_angajati IN (500, 600); 

--DECODE:
--1)Sa se afiseze salariatii si sa se mareasca salariul acelora care au id-ul rolului 
egal cu 1, 2 si 3 
SELECT id_salariat, nume_salariat, prenume_salariat, salariul, salariul*DECODE(id_rol, 1, 1.1, 
2, 1.2, 3, 1.3) AS salariul_dupa_marire 
FROM salariati; 

--CASE:
--1)Sa se clasifice companiile in functie de cifra lor de afaceri:
--A)Daca cifra de afaceri >= 1000000000000 -> Compania are succes
--B)Daca cifra de afaceri < 1000000000000 -> Compania are pierderi 
SELECT id_companie, nume_companie, cifra_afaceri, 
CASE 
WHEN cifra_afaceri >= 1000000000000 then 'Companie are succes' 
WHEN cifra_afaceri < 1000000000000 then 'Companie are pierderi' 
ELSE NULL 
END situatie_companie 
FROM publisheri; 

--2)Sa se observe daca jocul este exclusiv sau nu in functie de numarul de platforme pe care este disponibil: 
--A)Daca numarul de platforme > 1 -> Jocul nu este exclusiv 
--B)Daca numarul de platforme = 1 -> Jocul este exclusiv 
SELECT j.id_joc, j.nume_titlu, COUNT(jp.id_platforma) AS nr_platfome_disponibil, 
CASE 
WHEN COUNT(jp.id_platforma) > 1 THEN 'Jocul nu este exclusiv' 
WHEN COUNT(jp.id_platforma) = 1 THEN 'Jocul este exclusiv' 
ELSE NULL 
END exclusivitate 
FROM jocuri j, jocuri_platforme jp 
WHERE j.id_joc = jp.id_joc 
GROUP BY j.id_joc, j.nume_titlu;

--CERERI IMBRICATE:
--1)Sa se afiseze id-ul si numele jocului care apartine genului 'Role-playing'
SELECT id_joc, nume_titlu 
FROM jocuri 
WHERE id_gen IN (SELECT id_gen FROM genuri WHERE descriere_gen = 'Role-playing');

--2)Sa se scada numarul de angajati cu 50 pentru companiile al caror cifra de 
afacere este mai mica decat 1000000000000
UPDATE studiorui 
SET nr_angajati = nr_angajati - 50 
WHERE id_companie IN (SELECT id_companie FROM publisheri WHERE cifra_afaceri < 
1000000000000);

--FUNCTII SINGLE-ROW:
--1)Sa se afiseze toti salariatii care au numele 'doe' 
SELECT * FROM salariati 
WHERE id_salariat in (SELECT id_salariat FROM salariati WHERE lower(nume_salariat) = 'doe'); 

--2) Sa se selecteze toate rolurile al caror nume contine cuvantul 'GAME'
SELECT * FROM roluri 
WHERE upper(nume_rol) like 'GAME%';

--3)Sa se afiseze platformele al caror nume incepe cu litera 'P' 
SELECT * FROM platforme 
WHERE INITCAP(nume_platforma) LIKE 'P%';


--FUNCTII DE GRUP: 
--1)Sa se afiseze cifra minima de afaceri si cea maxima din tabela PUBLISHERI 
SELECT MIN(cifra_afaceri), MAX(cifra_afaceri) FROM publisheri;

--2)Sa se afiseze numarul minim de agnajati si cel maxim din tabela Studiouri 
SELECT MIN(nr_angajati), MAX(nr_angajati) FROM studiouri;

--3)Sa se afiseze costul minim de dezvoltare si cel maxim din tabela JOCURI 
SELECT MIN(costuri_dezvoltare), MAX(costuri_dezvoltare) FROM jocuri; 

--JONCTIUNI: 
--1)Sa se afiseze id-ul, numele studioului si numele publisher-ului 
SELECT studiouri.id_studio, studiouri.nume_studio, publisheri.nume_companie 
FROM studiouri, publisheri 
WHERE studiouri.id_companie = publisheri.id_companie;

--2)Sa se afiseze numele studioului, id-ul, numele si prenumele salaratilor care 
lucreaza in acel studio
SELECT studiouri.nume_studio, salariati.id_salariat, salariati.nume_salariat, 
salariati.prenume_salariat 
FROM studiouri, salariati 
WHERE studiouri.id_studio = salariati.id_studio;

--3)Sa se afiseze numele jocurilor si genul din care fac parte 
SELECT jocuri.nume_titlu, genuri.descriere_gen 
FROM jocuri, genuri 
WHERE jocuri.id_gen = genuri.id_gen;

--GESTIUNEA ALTOR OBIECTE ALE BAZEI DA DATE:
--------------------------------------------
--1)Sa se creeze un VIEW care sa afiseze toate detaliile companiei cu id-ul 1 
CREATE OR REPLACE VIEW v_publisheri_1 
AS SELECT * FROM publisheri 
WHERE id_companie = 1;

--2)Sa se creeze un INDEX pe tabela ROLURI pe coloana NUME_ROL
CREATE INDEX idx_roluri ON roluri(nume_rol); 

--3)Sa se creeze un SINONIM pentru tabela JOCURI_PLATFORME
CREATE SYNONYM jp for jocuri_platforme;

--4)Sa se creeze o SECVENTA pentru tabela SALARIATI
CREATE SEQUENCE seq_id_salariat 
START WITH 11 INCREMENT BY 1 
MAXVALUE 999;