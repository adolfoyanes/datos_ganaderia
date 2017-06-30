class AddIppToReproduccion < ActiveRecord::Migration[5.0]
  def change
    add_column :reproduccions, :ipp, :integer
  end
end
