#necesario para que interprete todo 
require 'uri'
require 'net/http'
require 'json'

#Guardar la url y api key de los Rovers de la NASA
url_NASA = 'https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=1000&'
api_NASA = 'api_key=gy0N21ifRPvdR54UWBQTAIMR9QhFmEc9Ry1JcP4G'

#Se obtiene los datos desde la API
def request(address, api_key)
    #Se concatena la address con la api_key
    url = URI(address + api_key)
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    request = Net::HTTP::Get.new(url)
    request["cache-control"] = 'no-cache'
    request["postman-token"] = '5f4b1b36-5bcd-4c49-f578-75a752af8fd5'
    response = http.request(request)

    #Para que devuelva un hash (método parse-> JSON to HASH)
    return JSON.parse(response.body)
end

#Se crea la variable que almacena el retorno del llamado al método request
data_NASA = request(url_NASA, api_NASA)
#Se extrae las fotos y se limita la cantidad de resultados
hash_photos = data_NASA["photos"]

def build_new_page(hash)

    #primera parte del HTML
    html = "<html>\n/<head>\n</head>\n<body>\n<ul>"  

    #Obtener todas las fotos
    hash.each do |elem|
        #se busca la imagen a través del key "img_src"
        html += "\t<li><img src=\"#{elem["img_src"]}\"></li>\n"
    end

    #Se agrega el final y se exporta a un archivo HTML
    html += "</ul>\n</body>\n</html>"
    File.write("output.html",html)

end

#Se crea la página web con lo solicitado
build_new_page(hash_photos)

#Hacer un hash con la cámara y la cantidad de repeticiones
def photos_count(hash)
    aux = ""
    #Extrae el nombre de la cámara, por elemento
    hash.each do |elem|
        aux += "#{elem["camera"]["name"]} "
    end
    #Transforma los elementos en array y luego los agrupa en el hash
    array_name = aux.split(" ")
    array_name.group_by(&:itself).transform_values(&:count)
end

#Se imprime el hash, entregándole como argumento el hash_photos
print "#{photos_count(hash_photos)} \n"