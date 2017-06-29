class Vaca < ApplicationRecord


	# para importar desde csv
  def self.import(file)
    CSV.foreach(file.path, headers: true, encoding:'iso-8859-1:utf-8') do |row|
    	puts row
    	puts row["fparto"]
    	puts row["fparto"].to_date
    	row["fparto"] = row["fparto"].to_date
      Vaca.create! row.to_hash
    end
  end
end
