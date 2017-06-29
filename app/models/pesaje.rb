class Pesaje < ApplicationRecord
	def self.import(file)
        CSV.foreach(file.path, headers: true, encoding:'iso-8859-1:utf-8') do |row|
        	puts row["parto"]
        	puts row["parto"].to_date
        	puts row["pesaje"]
        	puts row["pesaje"].to_date
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
             puts "base inicial"
             puts base
             produccion.each_with_index do |f, i| 
                puts i
               if i > 0
                 promedio = (f.lvd.to_f + produccion[i-1].lvd.to_f )/2 
                 puts promedio 
                 dias = (f.del - produccion[i-1].del).to_i 
                 puts dias 
                 base = base + (promedio * dias) 
                 puts base
                 puts f.id_2
               end ## cierra if
            end ### cierra do
        else
            base = 0
        end
        return base
    end
end
