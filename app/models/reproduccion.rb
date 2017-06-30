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
    end
end
