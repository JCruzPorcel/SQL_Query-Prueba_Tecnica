CREATE FUNCTION dbo.fn_EquipoColaboradores (@DNI VARCHAR(8))
RETURNS TABLE
AS
RETURN
(
    SELECT C.Id AS IdColaborador, 
           C.Nombre AS NombreColaborador, 
           D.Id AS idDepartamento, 
           D.Nombre AS NombreDepartamento, 
           P.Id AS idProyecto, 
           P.Nombre AS NombreProyecto, 
           P.FechaInicio, 
           P.FechaFin
    FROM Colaborador C
    JOIN AsignadoA AA ON C.Id = AA.idColaborador
    JOIN Proyecto P ON AA.idProyecto = P.Id
    JOIN Departamento D ON C.idDepartamento = D.Id
    WHERE C.DNI = @DNI
);
