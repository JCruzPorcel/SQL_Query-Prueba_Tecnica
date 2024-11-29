SELECT AVG(A.Precio) AS PrecioPromedio
FROM Articulos A
JOIN Fabricante F ON A.idFabricante = F.Id
WHERE F.Nombre LIKE '%agro%';
