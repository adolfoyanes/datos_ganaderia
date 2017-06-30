class AddIndCombinadoToReproduccion < ActiveRecord::Migration[5.0]
  def change
    add_column :reproduccions, :ind_combinado, :decimal
  end
end
