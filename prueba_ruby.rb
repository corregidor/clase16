continuar = true

def alumnos_aprobados(nota)
    file = File.open('promedio.txt', 'r')
    data = file.readlines
    file.close
    puts "Los Alumnos aprobados son:"
    arreglo_alumnos_aprobados = []
        data.each do |line|
            arreglo = line.split(', ')
            if arreglo[1].to_i >= nota.to_i
                puts "- #{arreglo[0]} con promedio #{arreglo[1]}"
            end
        end
end


while continuar
    puts 'Ingrese una opción'
    puts '1: Generar Archivo'
    puts '2: Contar cantidad inasistencias'
    puts '3: Nombre de Alumnos aprobados'
    puts '4: Salir'

    opcion = gets

    if opcion.to_i == 1
        puts "se selecciona opcion 1"
        file = File.open('alumnos.txt', 'r')
        data = file.readlines
        file.close
        arreglo_totales = []
        data.each do |line|
            promedio = 0
            arreglo = line.split(', ')
            promedio = (arreglo[1].to_i + arreglo[2].to_i + arreglo[3].to_i + arreglo[4].to_i + arreglo[5].to_i)/5
            #falta parametrizar el largo del arreglo como arreglo.length-1
            #recomiendo uso de float para los promedios
            arreglo_totales.push([arreglo[0], promedio])
        end

        file = File.open('promedio.txt', 'w')
        arreglo_totales.each do |par|
            file.puts "#{par.first}, #{par.last}"
        end
        file.close

    end

    if opcion.to_i == 2
        puts "se selecciona opcion 2"
        file = File.open('alumnos.txt', 'r')
        data = file.readlines
        file.close
        total_inasistencias = 0
        data.each do |line|
            line.split(', ').each do |word|
                #se puede limpiar la linea para evitar el \n con map(&:chomp)
                if word == 'A' ||  word == "A\n"
                    total_inasistencias += 1
                end
            end
        end
        puts total_inasistencias
        puts "La cantidad de inasistencias totales son: #{total_inasistencias}"
    end

    if opcion.to_i == 3
        alumnos_aprobados(5)
    end

    if opcion.to_i == 4
        continuar = false
    end


end