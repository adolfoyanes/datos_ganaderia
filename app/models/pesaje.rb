class Pesaje < ApplicationRecord
	def self.import(file)
        CSV.foreach(file.path, headers: true, encoding:'iso-8859-1:utf-8') do |row|
        	row["parto"] = row["parto"].to_date
        	row["pesaje"] = row["pesaje"].to_date
          Pesaje.create! row.to_hash
        end
    end

    def self.produccion_acumulada(este_animal)
        lactancias_totales = Pesaje.select("lactancia").group("lactancia").order("lactancia ASC")
        acumulado = 0
        lactancias_totales.each do |f|
            acumulado = acumulado + Pesaje.produccion_acumulada_lactancia(este_animal, f.lactancia).round(2)
        end
        return acumulado
    end
    def self.produccion_acumulada_lactancia(este_animal, lactancia)
         produccion = este_animal.where("lactancia"=>lactancia).order("del ASC")
         if produccion.size > 0 
             base = produccion.first.del * produccion.first.lvd.to_f 
             produccion.each_with_index do |f, i| 
               if i > 0
                 promedio = (f.lvd.to_f + produccion[i-1].lvd.to_f )/2 
                 dias = (f.del - produccion[i-1].del).to_i 
                 base = base + (promedio * dias) 
               end ## cierra if
            end ### cierra do
        else
            base = 0
        end
        return base
    end ### cierra produccion_acumulada_lactancia

    def self.promedio_x_animal(este_animal)
        lactancias_totales = Pesaje.select("lactancia").group("lactancia").order("lactancia ASC")
        acumulados = []
        lactancias_totales.each do |f|
            resultado = Pesaje.produccion_acumulada_lactancia(este_animal, f.lactancia).round(2)
            if resultado > 0 
                el_del = este_animal.where("lactancia"=>f.lactancia).order("del DESC").first.del
                if el_del > 304
                    resultado = resultado * (305.to_f/el_del.to_f)
                end
                acumulados << resultado.round(2)
            end
        end
        ## sacar promedio de acumulado 
        promedio = acumulados.inject{ |sum, el| sum + el }.to_f / acumulados.size
        ## devolver resultado
        return promedio.round(2)
    end

    def self.promedio_total(animales)
        promedios = []
        animales.each do |a|
            este_animal = Pesaje.where("id_2"=>a.id_2)
            promedios << Pesaje.promedio_x_animal(este_animal)
        end
        promedio_global = promedios.inject{ |sum, el| sum + el }.to_f / promedios.size
        return promedio_global.round(2)
    end

    def self.clasificacion(puntaje)
        cla = ""
        if puntaje <= 25
            cla = "Descarte"
        elsif puntaje <= 50
            cla = "Malas"
        elsif puntaje <= 75
            cla = "Buena"
        elsif puntaje <= 100
            cla = "Excelente"
        else
            cla = "Elite"
        end
        return cla  
    end







end ## cierra modelo
