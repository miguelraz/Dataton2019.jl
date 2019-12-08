using Dataton2019
using Test
using DataDeps, DataFrames, LightGraphs, CSV, ZipFile, JSON

@info "Hola Dataton2019!"
@testset "Datos" begin
    #global t1 = readdir(datadep"icijparadise2018")[1]
    #@test  "csv_paradise_papers.2018-02-14.zip" == t1
    #global t2 = readdir(datadep"icijpanamapapers2018")[1]
    #@test "csv_panama_papers.2018-02-14.zip" == t2
    global t3 = readdir(datadep"icijoffshore2018")[1]
    @test  "csv_offshore_leaks.2018-02-14.zip" == t3
    #global t4 = readdir(datadep"icijbahamas2017")[1]
    #@test  "csv_bahamas_leaks.2017-12-19.zip" == t4

    # Esta es una version mini de el archivo "contrataciones_arr.json"
    # Encontrado en https://github.com/pdnmx/datosdataton2019
    # Minimizamos el archivo con el comando 'split -n 100 contartaciones_arr.json'
    # y cambiamos el nombre de 'xaa' a 'mini.json'
    #
    # Encontramos la ultima entrada que se ha recortado y le pegamos un "]"
    #
    x = readlines(open("mini.json"))[1];
    #
    # julia> findlast("{\"_id\"",x)
    # 22869056:22869061
    #
    s6 = JSON.parse(x[1:22869054] * "]");

    @test length(s6) == 6462

end

# Hacemos el unzip del archivo de bahamas2017

#pars2018 = ZipFile.Reader(datadep"icijparadise2018" * "/" * t1)
#panama2018 = ZipFile.Reader(datadep"icijpanamapapers2018" * "/" * t2)
offshore2018 = ZipFile.Reader(datadep"icijoffshore2018" * "/" * t3)
#bahamas2017 = ZipFile.Reader(datadep"icijbahamas2017" * "/" * t4)

# Este es el formato de los archivos a investigar

# uncompressedsize method  mtime            name
# ----------------------------------------------
#        234614743 Deflate 2018-02-13 17-44 paradise_papers.edges.csv
#         47379240 Deflate 2018-02-13 17-40 paradise_papers.nodes.address.csv
#         64159484 Deflate 2018-02-13 17-40 paradise_papers.nodes.entity.csv
#           239615 Deflate 2018-02-13 17-40 paradise_papers.nodes.intermediary.csv
#         52548340 Deflate 2018-02-13 17-40 paradise_papers.nodes.officer.csv
#           371926 Deflate 2018-02-13 17-40 paradise_papers.nodes.other.csv

# pars2018address = CSV.read(pars2018.files[2]; threaded = true)
# pars2018entity = CSV.read(pars2018.files[3]; threaded = true)
# pars2018intermediares = CSV.read(pars2018.files[4]; threaded = true)
# pars2018officer = CSV.read(pars2018.files[5]; threaded = true)
# pars2018other = CSV.read(pars2018.files[6]; threaded = true)

# panama2018address = CSV.read(panama2018.files[1]; threaded = true)
# panama2018entity = CSV.read(panama2018.files[2]; threaded = true)
# panama2018interm = CSV.read(panama2018.files[3]; threaded = true)
# panama2018officer = CSV.read(panama2018.files[4]; threaded = true)


# bahamas2017address = CSV.read(bahamas2017.files[1]; threaded = true)
# bahamas2017entity = CSV.read(bahamas2017.files[2]; threaded = true)
# bahamas2017interm = CSV.read(bahamas2017.files[3]; threaded = true)
# bahamas2017officer = CSV.read(bahamas2017.files[4]; threaded = true)

# Extraemos a CSVs

offshore2018address = CSV.read(offshore2018.files[1]; threaded = true)
offshore2018entity = CSV.read(offshore2018.files[2]; threaded = true)
offshore2018interm = CSV.read(offshore2018.files[3]; threaded = true)
offshore2018officer = CSV.read(offshore2018.files[4]; threaded = true)


occursin.(offshore2018entity[:address], "Mexico") |> sum
occursin.(offshore2018entity[:address], "México") |> sum
occursin.(offshore2018entity[:address], "MX") |> sum
occursin.(offshore2018entity[:address], "Mx") |> sum
occursin.(offshore2018entity[:address], "MEX") |> sum
