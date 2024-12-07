CREATE DATABASE librería;

USE librería;

CREATE TABLE libros (
    ID_Libro INT(11) NOT NULL AUTO_INCREMENT,
    Titulo VARCHAR(100) NOT NULL,
    Autor VARCHAR(100) NOT NULL,
    Genero VARCHAR(100) NOT NULL,
    Año_Publicacion INT(4) NOT NULL,
    PRIMARY KEY (ID_Libro)
);

CREATE TABLE clientes (
  ID_Cliente INT(11) NOT NULL AUTO_INCREMENT,
  Nombre VARCHAR(100) NOT NULL,
  Correo VARCHAR(100) NOT NULL,
  Telefono VARCHAR(20) NOT NULL,
  PRIMARY KEY (ID_Cliente)
);

CREATE TABLE prestamos (
    ID_Prestamo INT(11) NOT NULL AUTO_INCREMENT,
    ID_Cliente INT(11) NOT NULL,
    ID_Libro INT(11) NOT NULL,
    Fecha_Prestamo DATE NOT NULL,
    Fecha_Devolucion DATE NOT NULL,
    PRIMARY KEY (ID_Prestamo),
    FOREIGN KEY (ID_Cliente) REFERENCES clientes (ID_Cliente),
    FOREIGN KEY (ID_Libro) REFERENCES libros (ID_Libro)
);

INSERT INTO libros (ID_Libro, Titulo, Autor, Genero, Año_Publicacion) VALUES 
(1, 'Cien años de soledad', 'Gabriel García Márquez', 'Realismo mágico', 1967), 
(2, 'La casa de los espíritus', 'Isabel Allende', 'Realismo mágico', 1982), 
(3, 'Rayuela', 'Julio Cortázar', 'Novela experimental', 1963), 
(4, 'La ciudad y los perros', 'Mario Vargas Llosa', 'Novela social', 1962), 
(5, 'Harry Potter y la piedra filosofal', 'J.K. Rowling', 'Fantasía', 1997), 
(6, 'El resplandor', 'Stephen King', 'Terror', 1977), 
(7, 'Juego de tronos', 'George R.R. Martin', 'Fantasía épica', 1996), 
(8, 'Kafka en la orilla', 'Haruki Murakami', 'Ficción contemporánea', 2002), 
(9, 'El señor de los anillos', 'J.R.R. Tolkien', 'Fantasía épica', 1954), 
(10, 'Asesinato en el Orient Express', 'Agatha Christie', 'Misterio', 1934);

INSERT INTO clientes (ID_Cliente, Nombre, Correo, Telefono) VALUES 
(1, 'Juan Pérez', 'juan.perez@gmail.com', 1234567890), 
(2, 'María Gómez', 'maria.gomez@hotmail.com', 2345678901), 
(3, 'Carlos Martínez', 'carlos.martinez@gmail.com', 3456789012), 
(4, 'Ana Rodríguez', 'ana.rodriguez@hotmail.com', 4567890123), 
(5, 'Luis López', 'luis.lopez@gmail.com', 5678901234), 
(6, 'Patricia Ramírez', 'patricia.ramirez@hotmail.com', 6789012345), 
(7, 'José Sánchez', 'jose.sanchez@gmail.com', 7890123456), 
(8, 'Laura Castillo', 'laura.castillo@hotmail.com', 8901234567), 
(9, 'Andrés Morales', 'andres.morales@gmail.com', 9012345678), 
(10, 'Sofía Torres', 'sofia.torres@hotmail.com', 1234509876);

INSERT INTO prestamos (ID_Prestamo, ID_Cliente, ID_Libro, Fecha_Prestamo, Fecha_Devolucion) VALUES 
(1, 1, 1, '2024-01-01', '2024-01-15'), 
(2, 2, 2, '2024-01-03', ), 
(3, 3, 5, '2024-01-05', '2024-01-20'), 
(4, 4, 4, '2024-01-07', '2024-01-22'), 
(5, 5, 5, '2024-01-10', '2024-01-24'), 
(6, 6, 1, '2024-01-12', ), 
(7, 7, 7, '2024-01-15', '2024-01-29'), 
(8, 8, 8, '2024-01-18', '2024-02-01'), 
(9, 9, 5, '2024-01-20', ), 
(10, 10, 10, '2024-01-22', '2024-02-05');

SELECT * FROM libros;

SELECT * FROM `prestamos` WHERE ID_Cliente = 5;

SELECT ID_Libro, COUNT(ID_Libro) AS Total_Prestamos FROM prestamos GROUP BY ID_Libro ORDER BY Total_Prestamos DESC LIMIT 3;

SELECT ID_Cliente, ID_Libro FROM prestamos WHERE (Fecha_Devolucion IS NULL OR Fecha_Devolucion = '' OR Fecha_Devolucion = '0000-00-00');
