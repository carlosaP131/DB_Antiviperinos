-- si existe la borra si no la crea 
drop database if exists antiviperinos_db;
-- Crear la base de datos
CREATE DATABASE antiviperinos_db;

-- Usar la base de datos
USE antiviperinos_db;

-- Tabla para almacenar información de los antiviperinos
CREATE TABLE antiviperinos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_comercial VARCHAR(100) NOT NULL,
    sustancias_activas VARCHAR(200) NOT NULL,
    fabricante VARCHAR(100),
    fecha_aprobacion DATE,
    indicaciones TEXT,
    precio DECIMAL(10, 2),
    disponible BOOLEAN
);

-- Tabla para almacenar información de las unidades médicas
CREATE TABLE unidades_medicas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    direccion VARCHAR(200),
    telefono VARCHAR(20),
    encargado varchar(100),
    ciudad VARCHAR(50),
	cantidad_total_antiviperinos INT DEFAULT 0
);

-- Tabla intermedia para relacionar antiviperinos y unidades médicas
CREATE TABLE antiviperino_unidad (
    id INT AUTO_INCREMENT PRIMARY KEY,
    antiviperino_id INT,
    unidad_medica_id INT,
    cantidad INT,
    FOREIGN KEY (antiviperino_id) REFERENCES antiviperinos(id),
    FOREIGN KEY (unidad_medica_id) REFERENCES unidades_medicas(id)
);
-- Crear tabla de usuarios
CREATE TABLE usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    correo_electronico VARCHAR(100) NOT NULL UNIQUE,
    contrasena VARCHAR(255) NOT NULL,
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    roles VARCHAR(50) DEFAULT 'USUARIO'
);




-- Insertar datos en la tabla de antiviperinos
INSERT INTO antiviperinos (nombre_comercial, sustancias_activas, fabricante, fecha_aprobacion, indicaciones, precio, disponible)
VALUES
  ('Antiviperino A', 'Sustancia A1, Sustancia A2', 'Fabricante X', '2023-01-15', 'Tratamiento de mordeduras de serpientes venenosas', 150.00, true),
    ('Antiviperino B', 'Sustancia B1, Sustancia B2', 'Fabricante Y', '2022-11-20', 'Antídoto para picaduras de serpientes peligrosas', 200.50, true),
    ('Antiviperino C', 'Sustancia C1, Sustancia C2', 'Fabricante Z', '2023-03-08', 'Neutralizador de veneno de serpientes venenosas', 250.75, false),
    ('Antiviperino D', 'Sustancia D1, Sustancia D2', 'Fabricante W', '2023-02-10', 'Tratamiento de mordeduras de serpientes venenosas', 180.00, true),
    ('Antiviperino E', 'Sustancia E1, Sustancia E2', 'Fabricante V', '2022-12-05', 'Antídoto para picaduras de serpientes peligrosas', 220.00, true),
    ('Antiviperino F', 'Sustancia F1, Sustancia F2', 'Fabricante U', '2022-10-15', 'Tratamiento de mordeduras de serpientes venenosas', 160.00, true),
    ('Antiviperino G', 'Sustancia G1, Sustancia G2', 'Fabricante T', '2023-04-25', 'Antídoto para picaduras de serpientes peligrosas', 190.50, true),
    ('Antiviperino H', 'Sustancia H1, Sustancia H2', 'Fabricante S', '2023-03-15', 'Tratamiento de mordeduras de serpientes venenosas', 175.00, true),
    ('Antiviperino I', 'Sustancia I1, Sustancia I2', 'Fabricante R', '2023-05-08', 'Antídoto para picaduras de serpientes peligrosas', 210.00, true),
    ('Antiviperino J', 'Sustancia J1, Sustancia J2', 'Fabricante Q', '2023-01-30', 'Neutralizador de veneno de serpientes venenosas', 260.25, false);
-- Insertar datos en la tabla de unidades médicas
INSERT INTO unidades_medicas (nombre, direccion, telefono,encargado,ciudad,cantidad_total_antiviperinos)
VALUES
    ('Hospital San Rafael', 'Calle Principal #123', '555-123-4567','DR. LUIS EFRAIN JIMENEZ CRUZ', 'Ciudad Medica', 2),
    ('ASUNCION OCOTLAN', 'Calle Principal #123', '555-123-4567','DR. LUIS EFRAIN JIMENEZ CRUZ', 'Ciudad Medica', 2),
    ('CIENEGA DE ZIMATLAN', 'Calle Principal #123', '555-123-4567','DR. GUIELLERMO OROZCO LEON', 'Ciudad Medica', 2),
    ('SAN ANTONIO POBLETE', 'Calle Principal #123', '555-123-4567','MPSS RODOLFO HERNÁNDEZ CLEMENTE','Ciudad Medica', 2),
    ('LA COMPAÑÍA Ejutla', 'Calle Principal #123', '555-123-4567','MPSS Angel Eduardo Noyola San Juan', 'Ciudad Medica', 2),
    ('AGUA DEL ESPINO', 'Calle Principal #123', '555-123-4567', 'MPSS Elizabeth Méndez','Ciudad Medica', 2),
    ('CONCEPCION PAPALO', 'Calle Principal #123', '555-123-4567', '	DR. JOSE EMILIANO CAMACHO ESCOBAR','Ciudad Medica', 2),
    ('	BARRIO EL ROSARIO', 'Calle Principal #123', '555-123-4567','	DRA. YOLANDA TEJA GARCIA', 'Ciudad Medica', 2),
    ('Clínica SerpienteSegura', 'Avenida Serpentina #456', '555-987-6543', 'DR. LUIS EFRAIN JIMENEZ CRUZ','Ciudad Segura', 3);

-- Insertar datos en la tabla de relación antiviperino_unidad
INSERT INTO antiviperino_unidad (antiviperino_id, unidad_medica_id,cantidad)
VALUES
    (1, 1,1),
    (2, 2,2),
	(3, 3,3),
	(4, 4,4),
	(5, 5,5),
    (6, 6,6);
    
    -- Insertar usuarios en la tabla usuarios
INSERT INTO usuarios (nombre, correo_electronico, contrasena, roles)
VALUES
    ('Usuario 1', 'usuario1@example.com', 'contrasena1', 'usuario'),
    ('Usuario 2', 'usuario2@example.com', 'contrasena2', 'usuario'),
    ('Admin 1', 'admin1@example.com', 'adminpass1', 'administrador'),
    ('Usuario 3', 'usuario3@example.com', 'contrasena3', 'usuario'),
    ('Usuario 4', 'usuario4@example.com', 'contrasena4', 'usuario'),
    ('Admin 2', 'admin2@example.com', 'adminpass2', 'administrador'),
    ('Usuario 5', 'usuario5@example.com', 'contrasena5', 'usuario'),
    ('Usuario 6', 'usuario6@example.com', 'contrasena6', 'usuario'),
    ('Usuario 7', 'usuario7@example.com', 'contrasena7', 'usuario'),
    ('Usuario 8', 'usuario8@example.com', 'contrasena8', 'usuario');
    
    
 