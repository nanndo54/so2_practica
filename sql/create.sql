CREATE DATABASE g2;

USE g2;

DROP TABLE client_bulk;

DROP TABLE client_services_bulk;

DROP TABLE client_contract_bulk;

DROP TABLE client_data_bulk;

DROP TABLE client;

DROP TABLE client_services;

DROP TABLE client_contract;

DROP TABLE client_data;

CREATE TABLE client_bulk (
    codigoID VARCHAR(20), nombre VARCHAR(50), apellido VARCHAR(50), genero VARCHAR(10), mayoriaDeEdad VARCHAR(10), estadoCivil VARCHAR(10), email VARCHAR(150), dependientes VARCHAR(10), address VARCHAR(150)
);

CREATE TABLE client_services_bulk (
    idCliente VARCHAR(20), apoyoTecnico VARCHAR(20), serviciosDeAlimentos VARCHAR(20), servicioTelefonico VARCHAR(20), servicioDeTransporte VARCHAR(20), lineasTelefonicas VARCHAR(20), serviciosMedicos VARCHAR(20), servicioDeInternet VARCHAR(20), ServiciosEntrega VARCHAR(20), seguridadOnline VARCHAR(20), serviciosParaMascotas VARCHAR(20), copiasDeSeguridad VARCHAR(20), serviciosEducativos VARCHAR(20), StreamingTV VARCHAR(20), servicioProteccio_nMovil VARCHAR(20), StreamingMovies VARCHAR(20)
);

CREATE TABLE client_contract_bulk (
    idCliente VARCHAR(20), contrato VARCHAR(30), facturaElectronica VARCHAR(10), metodosDePago VARCHAR(30)
);

CREATE TABLE client_data_bulk (
    idCliente VARCHAR(20), duracion VARCHAR(10), cargoMensual VARCHAR(30), cargoTotal VARCHAR(30), abandono VARCHAR(10)
);

CREATE TABLE client (
    id VARCHAR(20), name VARCHAR(50), surname VARCHAR(50), gender VARCHAR(10), is_adult BIT, is_married BIT, email VARCHAR(150), has_dependents BIT, address VARCHAR(150), PRIMARY KEY (id)
);

CREATE TABLE client_services (
    client_id VARCHAR(20), support VARCHAR(20), food VARCHAR(20), phone VARCHAR(20), transport VARCHAR(20), phone_line VARCHAR(20), medical VARCHAR(20), internet VARCHAR(20), delivery VARCHAR(20), online_security VARCHAR(20), pets VARCHAR(20), backups VARCHAR(20), education VARCHAR(20), tv VARCHAR(20), phone_security VARCHAR(20), movies VARCHAR(20), FOREIGN KEY (client_id) REFERENCES client (id)
);

CREATE TABLE client_contract (
    client_id VARCHAR(20),
    contract VARCHAR(30), is_digital_bill BIT, payment_method VARCHAR(30), FOREIGN KEY (client_id) REFERENCES client (id)
);

CREATE TABLE client_data (
    client_id VARCHAR(20), months_active INT, monthly_charge DECIMAL(15, 2), total_charge DECIMAL(15, 2), is_active BIT, FOREIGN KEY (client_id) REFERENCES client (id)
);
