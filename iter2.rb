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

#Programa que itera y entrega mese con ventas sobre 45.000
ventas.each do |k,v|
    print "#{k} " if v >45000
end
puts ""