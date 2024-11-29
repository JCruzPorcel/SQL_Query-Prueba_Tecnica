-- Crear tabla Fabricante
CREATE TABLE Fabricante (
    Id INT IDENTITY PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL
);

-- Crear tabla Articulos
CREATE TABLE Articulos (
    Codigo INT IDENTITY PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Precio DECIMAL(10, 2) NOT NULL,
    idFabricante INT NULL,
    FOREIGN KEY (idFabricante) REFERENCES Fabricante(Id)
);

-- Insertar datos en Fabricante
INSERT INTO Fabricante (Nombre) VALUES
('AgroTech'), 
('EcoFarm'), 
('BioAgro'), 
('TechParts');

-- Insertar datos en Articulos
INSERT INTO Articulos (Nombre, Precio, idFabricante) VALUES
('Semillas', 60.00, 1),
('Fertilizante', 280.50, 2),
('Tractor', 1200.00, 1),
('Herramientas', 150.75, 3),
('Pesticida', 450.00, 2),
('Repuesto', 320.00, NULL);
