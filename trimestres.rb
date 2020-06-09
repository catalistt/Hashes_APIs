#Hash entregado por enunciado
ventas = {
Enero: 15000,
Febrero: 22000,
Marzo: 12000,
Abril: 17000,
Mayo: 81000,
Junio: 13000,
Julio: 21000,
Agosto: 41200,
Septiembre: 25000,
Octubre: 21500,
Noviembre: 91000,
Diciembre: 21000
}

#Se transforman los montos en arreglos, para operar más sencillamente
montos = ventas.values
#Se crean arreglos auxiliares para guardar los keys y values (para luego transformalos a hash)
arreglo_montos = []
arreglo_titulos= []  
aux=1 

#Sumar montos por trimestres y agregarlos a un arreglo
#Hacer el nombre del trimestre con iteración y agregarlos a un arreglo
montos.each_slice(3) do |array| 
    suma = 0  #declaración y vuelta a 0 en cada iteración
    for elem in array  #para cada sub-arreglo, se suman sus montos y se crea el key
        suma += elem
        titulo = "Q#{aux}"
    end
    arreglo_montos += [suma]  #Se agrega el valor al arreglo y se vuelve a iterar
    arreglo_titulos += [titulo] #Se agrega el título al arreglo y se vuelve a iterar
    aux += 1  #Se le suma 1 al número del key
end

hash = arreglo_titulos.zip(arreglo_montos) #Uno ambos arreglos
hash = hash.to_h #los transformo a elementos del hash
print hash