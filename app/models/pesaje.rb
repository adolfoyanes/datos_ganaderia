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
         produccion = este_animal.order("del ASC") 
         base = produccion.first.del * produccion.first.lvd.to_f 
         produccion.each_with_index do |f, i| 
           if i > 1 
             promedio = (f.lvd.to_f + produccion[i-1].lvd.to_f )/2 
             puts promedio 
             dias = (f.pesaje - produccion[i-1].pesaje).to_i 
             puts dias 
             base = base + (promedio * dias) 
             puts base.class
             puts f.id_2
           end ## cierra if
        end ### cierra do
        return base
    end
    def self.produccion_acumulada_lactancia(este_animal, lactancia)
         produccion = este_animal.where("lactancia"=>lactancia).order("del ASC")
         if produccion.size > 0 
             base = produccion.first.del * produccion.first.lvd.to_f 
             produccion.each_with_index do |f, i| 
               if i > 1 
                 promedio = (f.lvd.to_f + produccion[i-1].lvd.to_f )/2 
                 puts promedio 
                 dias = (f.pesaje - produccion[i-1].pesaje).to_i 
                 puts dias 
                 base = base + (promedio * dias) 
                 puts base.class
                 puts f.id_2
               end ## cierra if
            end ### cierra do
        else
            base = 0
        end
        return base
    end
end
