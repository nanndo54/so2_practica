USE g2;

BULK INSERT client_bulk
FROM '/root/personales.csv'
WITH (
        FIELDTERMINATOR = ',', ROWTERMINATOR = '\n', FIRSTROW = 2
    );

BULK INSERT client_services_bulk
FROM '/root/servicios.csv'
WITH (
        FIELDTERMINATOR = ',', ROWTERMINATOR = '\n', FIRSTROW = 2
    );

BULK INSERT client_contract_bulk
FROM '/root/tiposDeContrato.csv'
WITH (
        FIELDTERMINATOR = ',', ROWTERMINATOR = '\n', FIRSTROW = 2
    );

BULK INSERT client_data_bulk
FROM '/root/otrasVariables.csv'
WITH (
        FIELDTERMINATOR = ',', ROWTERMINATOR = '\n', FIRSTROW = 2
    );

SELECT * FROM client;

INSERT INTO
    client (
        id, name, surname, gender, is_adult, is_married, email, has_dependents, address
    )
SELECT
    codigoID,
    nombre,
    apellido,
    genero,
    CASE
        WHEN mayoriaDeEdad = '1' THEN 1
        ELSE 0
    END,
    CASE
        WHEN estadoCivil = 'Yes' THEN 1
        ELSE 0
    END,
    email,
    CASE
        WHEN dependientes = 'Yes' THEN 1
        ELSE 0
    END,
    address
FROM client_bulk;

INSERT INTO
    client_services (
        client_id, support, food, phone, transport, phone_line, medical, internet, delivery, online_security, pets, backups, education, tv, phone_security, movies
    )
SELECT
    idCliente,
    apoyoTecnico,
    serviciosDeAlimentos,
    servicioTelefonico,
    servicioDeTransporte,
    lineasTelefonicas,
    serviciosMedicos,
    servicioDeInternet,
    ServiciosEntrega,
    seguridadOnline,
    serviciosParaMascotas,
    copiasDeSeguridad,
    serviciosEducativos,
    StreamingTV,
    servicioProteccio_nMovil,
    StreamingMovies
FROM client_services_bulk;

INSERT INTO
    client_contract (
        client_id,
        contract, is_digital_bill, payment_method
    )
SELECT
    idCliente,
    contrato,
    CASE
        WHEN facturaElectronica = 'Yes' THEN 1
        ELSE 0
    END,
    metodosDePago
FROM client_contract_bulk;

INSERT INTO
    client_data (
        client_id, months_active, monthly_charge, total_charge, is_active
    )
SELECT
    idCliente,
    TRY_PARSE(duracion AS INT),
    CASE
        WHEN TRIM(cargoMensual) = '' THEN NULL
        ELSE TRY_PARSE(
            cargoMensual AS DECIMAL(15, 2)
        )
    END,
    TRY_PARSE(cargoTotal AS DECIMAL(15, 2)),
    CASE
        WHEN abandono = 'No' THEN 1
        ELSE 0
    END
FROM client_data_bulk;

SELECT * FROM client_data WHERE total_charge IS NULL;

SELECT * FROM client_data_bulk;

SELECT CAST('1.1' AS DECIMAL(15, 2));

DELETE FROM client_data;
