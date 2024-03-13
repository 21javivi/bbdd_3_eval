CREATE DATABASE IF NOT EXISTS fabricantes;
USE fabricantes;

CREATE TABLE IF NOT EXISTS fabricante (
codFabricante INT(10) NOT NULL,
nombre VARCHAR(100),
PRIMARY KEY (codFabricante)
);

CREATE TABLE IF NOT EXISTS producto (
codProducto INT(10) NOT NULL AUTO_INCREMENT,
codFabricante INT(10),
nombre VARCHAR(100) NOT NULL,
precio DECIMAL(5,1) NOT NULL,
PRIMARY KEY (codProducto),
CONSTRAINT fk_01 FOREIGN KEY (codFabricante) REFERENCES fabricante(codFabricante) ON DELETE SET NULL ON UPDATE CASCADE
);


START TRANSACTION;

INSERT INTO fabricante (codFabricante, nombre) VALUES
(1, "Sony"),
(2, "Creative Labs"),
(3, "Hewlett-Packard"),
(4, "Iomega"),
(5, "Fujitsu"),
(6, "Winchester"),
(7, "Bose");

SAVEPOINT datosFabricante;

INSERT INTO producto (codFabricante, nombre, precio) VALUES
(1, "Hard drive", 240.5),
(2, "Memory", 120.6),
(3, "ZIP drive", 150.4),
(4, "Floppy disk", 5.6),
(5, "Monitor", 240.1),
(6, "DVD drive", 180.2),
(7, "CD drive", 90.2),
(1, "Printer", 270.3),
(1, "Toner cartridge", 66.3),
(1, "DVD burner", 180.2);

SAVEPOINT datosProducto;

COMMIT;