 USE antiviperinos_db;
 drop procedure if exists AntiviperinosPorUnidad;
DELIMITER //
CREATE PROCEDURE AntiviperinosPorUnidad()
BEGIN
    SELECT um.nombre AS unidad_medica, COUNT(au.antiviperino_id) AS cantidad_antiviperinos
    FROM unidades_medicas um
    LEFT JOIN antiviperino_unidad au ON um.id = au.unidad_medica_id
    GROUP BY um.id;
END;

//

DELIMITER ;

drop procedure if exists AgregarAntiviperino;
DELIMITER //

CREATE PROCEDURE AgregarAntiviperino(
    IN p_nombre_comercial VARCHAR(100),
    IN p_sustancias_activas VARCHAR(200),
    IN p_fabricante VARCHAR(100),
    IN p_fecha_aprobacion DATE,
    IN p_indicaciones TEXT,
    IN p_precio DECIMAL(10, 2),
    IN p_disponible BOOLEAN
)
BEGIN
    INSERT INTO antiviperinos (nombre_comercial, sustancias_activas, fabricante, fecha_aprobacion, indicaciones, precio, disponible)
    VALUES (p_nombre_comercial, p_sustancias_activas, p_fabricante, p_fecha_aprobacion, p_indicaciones, p_precio, p_disponible);
END;

//
DELIMITER ;

drop procedure if exists AgregarAntiviperinoAUnidad;
DELIMITER //

CREATE PROCEDURE AgregarAntiviperinoAUnidad(
    IN p_antiviperino_id INT,
    IN p_unidad_medica_id INT,
    IN p_cantidad INT
)
BEGIN
    DECLARE existing_count INT;
    
    -- Verificar si ya existe una relación antiviperino-unidad
    SELECT cantidad INTO existing_count
    FROM antiviperino_unidad
    WHERE antiviperino_id = p_antiviperino_id AND unidad_medica_id = p_unidad_medica_id;
    
    IF existing_count IS NULL THEN
        -- Si no existe, insertar nueva relación
        INSERT INTO antiviperino_unidad (antiviperino_id, unidad_medica_id, cantidad)
        VALUES (p_antiviperino_id, p_unidad_medica_id, p_cantidad);
    ELSE
        -- Si existe, actualizar cantidad
        UPDATE antiviperino_unidad
        SET cantidad = cantidad + p_cantidad
        WHERE antiviperino_id = p_antiviperino_id AND unidad_medica_id = p_unidad_medica_id;
    END IF;
END;

//

DELIMITER ;




