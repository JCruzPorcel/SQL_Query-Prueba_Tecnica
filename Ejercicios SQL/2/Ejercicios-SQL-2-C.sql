
-- Stored Procedure para obtener los colaboradores ocupados entre dos fechas
CREATE PROCEDURE dbo.sp_ColaboradoresOcupados
    @FechaInicio DATETIME,
    @FechaFin DATETIME
AS
BEGIN
    SELECT C.Id AS IdColaborador,
           C.Nombre AS NombreColaborador,
           SUM(AA.Horas) AS HorasTotales,
           (SUM(AA.Horas) * 100.0 / P.Horas) AS PorcentajeHoras,
           P.Nombre AS NombreProyecto,
           P.FechaInicio,
           P.FechaFin
    FROM AsignadoA AA
    JOIN Colaborador C ON AA.idColaborador = C.Id
    JOIN Proyecto P ON AA.idProyecto = P.Id
    WHERE P.FechaInicio BETWEEN @FechaInicio AND @FechaFin
    GROUP BY C.Id, C.Nombre, P.Id, P.Nombre, P.FechaInicio, P.FechaFin, P.Horas;
END;
