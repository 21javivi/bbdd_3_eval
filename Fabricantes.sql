CREATE DATABASE IF NOT EXISTS fabricantes;
USE fabricantes;

CREATE TABLE IF NOT EXISTS fabricante(
codFabricante int(10) ZEROFILL NOT NULL,
nombre VARCHAR(100),
PRIMARY KEY (codFabricante)
);

CREATE TABLE IF NOT EXISTS producto(
codProducto int(10) NOT NULL,
codFabricante int(10) ZEROFILL,
nombre varchar(100) NOT NULL,
precio DECIMAL(5,1) NOT NULL,
PRIMARY KEY (codProducto),
CONSTRAINT fk_01 FOREIGN KEY(codFabricante) REFERENCES fabricante(codFabricante)ON DELETE SET NULL ON UPDATE CASCADE 
);


START TRANSACTION;

INSERT INTO fabricante VALUES (0000000001,"Sony"),(0000000002,"Creative Labs"),(0000000003,"Hewlett-Packard"),(0000000004,"Iomega"),(0000000005,"Fujitsu"),(0000000006,"Winchester"),(0000000007,"Bose");

SAVEPOINT datosFabricante;

INSERT INTO producto VALUES (1,0000000001,"Hard drive", 240.5),(2,0000000002,"Memory", 120.6),(3,0000000003,"ZIP drive", 150.4),(4,0000000004,"Floppy disk", 5.6),(5,0000000005,"Monitor", 240.1),(6,0000000006,"DVD drive", 180.2),(7,0000000007,"CD drive", 90.2),(8,0000000001,"Printer", 270.3),(9,0000000001,"Toner cartridge", 66.3),(10,0000000001,"DVD burner", 180.2);

SAVEPOINT datosProducto;

COMMIT;