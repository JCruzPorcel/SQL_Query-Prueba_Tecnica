-- Crear tabla Departamento
CREATE TABLE Departamento (
    Id INT PRIMARY KEY,
    Nombre VARCHAR(300) NOT NULL
);

-- Crear tabla Colaborador
CREATE TABLE Colaborador (
    Id INT PRIMARY KEY,
    DNI VARCHAR(8) NOT NULL,
    Nombre VARCHAR(300) NOT NULL,
    idDepartamento INT,
    FOREIGN KEY (idDepartamento) REFERENCES Departamento(Id)
);

-- Crear tabla Proyecto
CREATE TABLE Proyecto (
    Id INT PRIMARY KEY,
    Nombre VARCHAR(300) NOT NULL,
    Horas INT NOT NULL,
    FechaInicio DATETIME NOT NULL,
    FechaFin DATETIME NOT NULL
);

-- Crear tabla AsignadoA
CREATE TABLE AsignadoA (
    idColaborador INT,
    idProyecto INT,
    Horas INT NOT NULL,
    PRIMARY KEY (idColaborador, idProyecto),
    FOREIGN KEY (idColaborador) REFERENCES Colaborador(Id),
    FOREIGN KEY (idProyecto) REFERENCES Proyecto(Id)
);

-- Insertar datos en Departamento
INSERT INTO Departamento (Id, Nombre) VALUES
(1, 'Finanzas'),
(2, 'Recursos Humanos'),
(3, 'Tecnología'),
(4, 'Operaciones');

-- Insertar datos en Colaborador
INSERT INTO Colaborador (Id, DNI, Nombre, idDepartamento) VALUES
(1, '12345678', 'Juan Pérez', 1),
(2, '87654321', 'María López', 3),
(3, '23456789', 'Ana Torres', 2),
(4, '34567890', 'Carlos Ramírez', 1);

-- Insertar datos en Proyecto
INSERT INTO Proyecto (Id, Nombre, Horas, FechaInicio, FechaFin) VALUES
(1, 'Proyecto Alpha', 100, '2024-12-03', '2025-01-15'),
(2, 'Proyecto Beta', 200, '2024-12-01', '2025-02-20'),
(3, 'Proyecto Gamma', 150, '2024-11-29', '2025-01-31');

-- Insertar datos en AsignadoA
INSERT INTO AsignadoA (idColaborador, idProyecto, Horas) VALUES
(1, 1, 20),
(1, 2, 30),
(2, 1, 50),
(3, 2, 70),
(4, 3, 60);
