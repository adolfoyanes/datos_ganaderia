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
end
