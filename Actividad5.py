#Crear una tupla en Python con el nombre de “Historial” la cual contenga los siguientes valores:2350, 5960, 23000, 1000, 8900
#Que representa montos de atención en pesos por diferentes servicios/consultas de la mascota “Puppy”
#Calcular el monto total gastado a lo largo del tiempo por atención de “Puppy”
#Si el gasto efectuado es menor a 30000, mostrar en pantalla dicho resultado, 
#Caso contrario mostrar el mensaje “Gastos por encima de lo presupuestado”

#Creo la tupla
Historial=(2350,5960,23000,1000,8900)

#Desempaqueto la tupla
monto1,monto2,monto3,monto4,monto5=Historial

#sumo los montos
Puppy=monto1+monto2+monto3+monto4+monto5

#Comparo los montos
if Puppy<30000:
    print(Puppy)
else:
    print("Gastos por encima de lo presupuestado.")
