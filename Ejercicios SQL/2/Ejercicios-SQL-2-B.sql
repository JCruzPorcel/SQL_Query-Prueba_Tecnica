
-- Stored Procedure para actualizar proyectos con condiciones específicas
CREATE PROCEDURE dbo.sp_ActualizarProyectosConFinanzas
    @DNI VARCHAR(8)
AS
BEGIN
    -- Crear tabla temporal con los proyectos y equipos relacionados al colaborador con el DNI especificado
    CREATE TABLE #EquipoColaboradores AS
    SELECT C.Id AS IdColaborador,
           C.Nombre AS NombreColaborador,
           D.Id AS idDepartamento,
           D.Nombre AS NombreDepartamento,
           P.Id AS idProyecto, 
           P.FechaInicio,
           P.FechaFin
    FROM Colaborador C
    JOIN AsignadoA AA ON C.Id = AA.idColaborador
    JOIN Proyecto P ON AA.idProyecto = P.Id
    JOIN Departamento D ON C.idDepartamento = D.Id
    WHERE C.DNI = @DNI;

    -- Actualizar proyectos que cumplan las condiciones
    UPDATE P
    SET P.FechaInicio = DATEADD(DAY, 2, P.FechaInicio)
    FROM Proyecto P
    JOIN #EquipoColaboradores E ON P.Id = E.idProyecto
    JOIN AsignadoA AA ON P.Id = AA.idProyecto
    JOIN Colaborador C ON AA.idColaborador = C.Id
    JOIN Departamento D ON C.idDepartamento = D.Id
    WHERE D.Nombre = 'Finanzas'
      AND DATENAME(WEEKDAY, P.FechaInicio) = 'Tuesday'
      AND P.FechaInicio > GETDATE();

    -- Eliminar la tabla temporal
    DROP TABLE #EquipoColaboradores;
END;
