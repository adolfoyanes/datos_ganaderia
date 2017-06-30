class AddIndiceToReproduccion < ActiveRecord::Migration[5.0]
  def change
    add_column :reproduccions, :indice, :decimal
  end
end
