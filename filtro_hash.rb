ventas = {
Octubre: 65000,
Noviembre: 68000,
Diciembre: 72000
}

def filtrar_hash(hash)
    hash_filtrado = {}

    hash.each do |k,v|
        hash_filtrado[k] = v if v < 70000
    end
    hash_filtrado
end

puts filtrar_hash(ventas)