SELECT F.Nombre
FROM Fabricante F
JOIN Articulos A ON F.Id = A.idFabricante
GROUP BY F.Nombre
HAVING AVG(A.Precio) >= 450;
