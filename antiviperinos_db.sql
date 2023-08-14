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




-- Insertar datos en la tabla de antiviperinos
INSERT INTO antiviperinos (nombre_comercial, sustancias_activas, fabricante, fecha_aprobacion, indicaciones, precio, disponible)
VALUES
    ('VenomAid', 'Sustancia A, Sustancia B', 'PharmaSnake Inc.', '2023-01-15', 'Tratamiento de mordeduras de serpientes venenosas', 150.00, true),
    ('SerpentGuard', 'Sustancia C, Sustancia D', 'BioMed Labs', '2022-11-20', 'Antídoto para picaduras de serpientes peligrosas', 200.50, true);

-- Insertar datos en la tabla de unidades médicas
INSERT INTO unidades_medicas (nombre, direccion, telefono, ciudad,cantidad_total_antiviperinos)
VALUES
    ('Hospital San Rafael', 'Calle Principal #123', '555-123-4567', 'Ciudad Medica', 2),
    ('Clínica SerpienteSegura', 'Avenida Serpentina #456', '555-987-6543', 'Ciudad Segura', 3);

-- Insertar datos en la tabla de relación antiviperino_unidad
INSERT INTO antiviperino_unidad (antiviperino_id, unidad_medica_id,cantidad)
VALUES
    (1, 1,1),
    (1, 2,1),
    (2, 2,1);
    
    
 