START TRANSACTION;

INSERT INTO autor VALUES ('AUT001','William Norton','UK','Cambridge'),
('AUT002','William Maugham','Canada','Toronto'),
('AUT003','William Anthony','UK',''),
('AUT004','S.B.Swaminathan','India','Leeds'),
('AUT005','Thomas Morgan','Germany','Arnsberg'),
('AUT006','Thomas Merton','USA','New York'),
('AUT007','Piers Gibson','UK','London'),
('AUT008','Nikolai Dewey','USA','Atlanta'),
('AUT009','Marquis de Ellis','Brazil','Rio De Janerio'),
('AUT010','Joseph Milton','USA','Houston'),
('AUT011','John Betjeman Hunter','Australia','Sydney'),
('AUT012','Evan Hayek','Canada','Vancouver'),
('AUT013','E. Howard','Australia','Adelaide'),
('AUT014','C. J. Wilde','UK','London'),
('AUT015','Butler Andre','USA','Florida');

SAVEPOINT autor;

INSERT INTO publicacion VALUES ('P001','Jex Max Publication','New York','USA','New York',15,'1969-12-25'),
('P002','BPP Publication','Mumbai','India','New Delhi',10,'1985-10-01'),
('P003','New Harrold Publication','Adelaide','Australia','Sydney',6,'1975-09-05'),
('P004','Ultra Press Inc.','London','UK','London',8,'1948-07-10'),
('P005','Mountain Publication','Houstan','USA','Sun Diego',25,'1975-01-01'),
('P006','Summer Night Publication','New York','USA','Atlanta',10,'1990-12-10'),
('P007','Pieterson Grp. of Publishers','Cambridge','UK','London',6,'1950-07-15'),
('P008','Novel Publisher Ltd.','New Delhi','India','Bangalore',10,'2000-01-01');

SAVEPOINT publicacion;

/*Se pueden poner las fechas con comillas simples o dobles */
/* Los campo NULL deben de ir sin comillas*/
INSERT INTO libro VALUES ('BK001','Introduction to Electrodynamics',979001,'CA001','AUT001','p003',"2001-5-8",'English',201,85.00);
INSERT INTO libro VALUES ('BK002','Understanding of Steel Construction',979002,'CA002','AUT002','p001',"2003-07-15",'English',300,105.50);
INSERT INTO libro VALUES ('BK003','Guide to Networking',979003,'CA003','AUT003','p002',"2002-09-10",'Hindi',510,200);
INSERT INTO libro VALUES ('BK004','Transfer  of Heat and Mass',979004,'CA002','AUT004','p004','2004-02-16','English',600,250.00);
INSERT INTO libro VALUES ('BK005','Conceptual Physics',979005,'CA001','AUT005','p006',"2003-07-16",NULL,345,145.00);
INSERT INTO libro VALUES ('BK006','Fundamentals of Heat',979006,'CA001','AUT006','p005','2003-08-10','German',247,112.00);
INSERT IGNORE INTO libro VALUES ('BK007','Advanced 3d Graphics',979007,'CA003','AUT007','p002','2004-02-16','Hindi',165,56.00);
INSERT IGNORE INTO libro VALUES ('BK008','Human Anatomy',979008,'CA008','AUT008','p006','2001-05-17','German',88,50.50);
INSERT IGNORE INTO libro VALUES ('BK009','Mental Health Nursing',979009,'CA009','AUT009','p007','2004-02-10','English',350,88.00);
INSERT IGNORE INTO libro VALUES ('BK010','Fundamentals of Thermodynamics',979010,'CA002','AUT010','p007','2002-10-14','English',400,225.00);
INSERT IGNORE INTO libro VALUES ('BK011','The Experimental Analysis of Cat',979011,'CA004','AUT011','p005','2007-06-09','French',225,95.00);
INSERT IGNORE INTO libro VALUES ('BK012','The Nature  of World',979012,'CA004','AUT005','p008','2005-12-20','English',350,88.00);
INSERT IGNORE INTO libro VALUES ('BK013','Environment a Sustainable Future',979013,'CA004','AUT012','p001','2003-10-27','German',165,100.00);
INSERT IGNORE INTO libro VALUES ('BK014','Concepts in Health',979014,'CA005','AUT013','p004','2001-08-25',NULL,320,180.00);
INSERT IGNORE INTO libro VALUES ('BK015','Anatomy & Physiology ',979015,'CA005','AUT014','p008','2000-10-10','Hindi',135,135.00);
INSERT IGNORE INTO libro VALUES ('BK016','Networks and Telecommunications',979016,'CA003','AUT015','p003','2002-01-01','French',95,45.00);

SAVEPOINT libroFechaComillasDobles;



/* Campo fecha sin comillas, No apto para ningun SGBD*/
INSERT INTO libro VALUES ('BK001','Introduction to Electrodynamics',979001,'CA001','AUT001','p003',2001-05-08,'English',201,85.00),
('BK002','Understanding of Steel Construction',979002,'CA002','AUT002','p001',2003-07-15,'English',300,105.50),
('BK003','Guide to Networking',979003,'CA003','AUT003','p002',2002-09-10,'Hindi',510,200),
('BK004','Transfer  of Heat and Mass',979004,'CA002','AUT004','p004',2004-02-16,'English',600,250.00),
('BK005','Conceptual Physics',979005,'CA001','AUT005','p006',2003-07-16,'NULL',345,145.00),
('BK006','Fundamentals of Heat',979006,'CA001','AUT006','p005',2003-08-10,'German',247,112.00),
('BK007','Advanced 3d Graphics',979007,'CA003','AUT007','p002',2004-02-16,'Hindi',165,56.00),
('BK008','Human Anatomy',979008,'CA008','AUT008','p006',2001-05-17,'German',88,50.50),
('BK009','Mental Health Nursing',979009,'CA009','AUT009','p007',2004-02-10,'English',350,88.00),
('BK010','Fundamentals of Thermodynamics',979010,'CA002','AUT010','p007',2002-10-14,'English',400,225.00),
('BK011','The Experimental Analysis of Cat',979011,'CA004','AUT011','p005',2007-06-09,'French',225,95.00),
('BK012','The Nature  of World',979012,'CA004','AUT005','p008',2005-12-20,'English',350,88.00),
('BK013','Environment a Sustainable Future',979013,'CA004','AUT012','p001',2003-10-27,'German',165,100.00),
('BK014','Concepts in Health',979014,'CA005','AUT013','p004',2001-08-25,'NULL',320,180.00),
('BK015','Anatomy & Physiology ',979015,'CA005','AUT014','p008',2000-10-10,'Hindi',135,135.00),
('BK016','Networks and Telecommunications',979016,'CA003','AUT015','p003',2002-01-01,'French',95,45.00);

SAVEPOINT fechaLibroSinComillas;

/* Campo fecha con comillas, apto para ORCALE. Actúa como un String*/
INSERT INTO libro VALUES ('BK001','Introduction to Electrodynamics',979001,'CA001','AUT001','p003','2001-05-08','English',201,85.00),
('BK002','Understanding of Steel Construction',979002,'CA002','AUT002','p001','2003-07-15','English',300,105.50),
('BK003','Guide to Networking',979003,'CA003','AUT003','p002','2002-09-10','Hindi',510,200),
('BK004','Transfer  of Heat and Mass',979004,'CA002','AUT004','p004','2004-02-16','English',600,250.00),
('BK005','Conceptual Physics',979005,'CA001','AUT005','p006','2003-07-16','NULL',345,145.00),
('BK006','Fundamentals of Heat',979006,'CA001','AUT006','p005','2003-08-10','German',247,112.00),
('BK007','Advanced 3d Graphics',979007,'CA003','AUT007','p002','2004-02-16','Hindi',165,56.00),
('BK008','Human Anatomy',979008,'CA008','AUT008','p006','2001-05-17','German',88,50.50),
('BK009','Mental Health Nursing',979009,'CA009','AUT009','p007','2004-02-10','English',350,88.00),
('BK010','Fundamentals of Thermodynamics',979010,'CA002','AUT010','p007','2002-10-14','English',400,225.00),
('BK011','The Experimental Analysis of Cat',979011,'CA004','AUT011','p005','2007-06-09','French',225,95.00),
('BK012','The Nature  of World',979012,'CA004','AUT005','p008','2005-12-20','English',350,88.00),
('BK013','Environment a Sustainable Future',979013,'CA004','AUT012','p001','2003-10-27','German',165,100.00),
('BK014','Concepts in Health',979014,'CA005','AUT013','p004','2001-08-25','NULL',320,180.00),
('BK015','Anatomy & Physiology ',979015,'CA005','AUT014','p008','2000-10-10','Hindi',135,135.00),
('BK016','Networks and Telecommunications',979016,'CA003','AUT015','p003','2002-01-01','French',95,45.00);

SAVEPOINT fechaLibroComillas;


COMMIT;