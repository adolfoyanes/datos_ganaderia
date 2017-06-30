class Reproduccion < ApplicationRecord

	def self.import(file)
        CSV.foreach(file.path, headers: true, encoding:'iso-8859-1:utf-8') do |row|

	        if row["nacimiento"] then row["nacimiento"] = row["nacimiento"].to_date end
	        if row["parto"] then 	row["parto"] = row["parto"].to_date end
	        if row["prenez"] then 	row["prenez"] = row["prenez"].to_date end
	        if row["secado"] then 	row["secado"] = row["secado"].to_date end
	        if row["fecha_salida"] then 	row["fecha_salida"] = row["fecha_salida"].to_date end
          Reproduccion.create! row.to_hash
        end

        ### sacar el ipp y ER
        Reproduccion.ipp(Reproduccion.all)
        ## sacar indice reproductivo
        Reproduccion.ir(Reproduccion.all)
    end

    def self.ipp(vacas)
    	vacas.each do |v|
    		partos = Reproduccion.where("id_2"=>v.id_2).order("parto asc")
    		partos.each_with_index do |f, i|
    			if i > 0 && f.parto.present? && partos[i-1].parto.present?
    				ipp = (f.parto - partos[i-1].parto).to_i
    				f.ipp = ipp
    				f.er = (1/ipp.to_f)*1000
    				f.save
    				puts ipp
    			else
    				puts "no"
    			end
       		end
    	end
    end ## cierra ipp

    def self.ir(vacas)

    	ips = vacas.where("ipp is not null").average("er").round(2)
    	vacas.each do |v|
    		if v.er 
    			v.indice = (v.er.to_f/ips.to_f)*100
    			v.save
    		end
    	end


    end

end
