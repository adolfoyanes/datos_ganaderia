class AddErToReproduccion < ActiveRecord::Migration[5.0]
  def change
    add_column :reproduccions, :er, :decimal
  end
end
