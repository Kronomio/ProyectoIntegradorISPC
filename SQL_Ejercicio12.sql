#Obtener todos los perros de sexo “Macho” nacidos entre 2020 y 2022.

SELECT nombre,Fecha_nac
FROM Perro
WHERE sexo ='MACHO' AND (Fecha_nac BETWEEN '01/01/2020' AND '31/12/2022')