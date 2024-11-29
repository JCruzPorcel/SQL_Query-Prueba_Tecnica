SELECT A.Codigo, A.Nombre AS Producto, A.Precio, 
       ISNULL(F.Nombre, 'SIN FABRICANTE') AS Fabricante
FROM Articulos A
LEFT JOIN Fabricante F ON A.idFabricante = F.Id;
