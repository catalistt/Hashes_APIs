#Se recibe el parámetro al inicio del programa
#Me veo en la OBLIGACIÓN de hacer esta variable global, para cumplir las instrucciones del desafio
$parametro = ARGV[0].to_i

#definición del método
def filter(hash)
    nuevo_hash = {}
    hash.each do |k,v|
        if v > $parametro
            nuevo_hash[k] = v
        else
        end
    end
    nuevo_hash
end

#Ejemplo
puts filter({n1:1,n2:2,n3:3,n4:4})
            
    
