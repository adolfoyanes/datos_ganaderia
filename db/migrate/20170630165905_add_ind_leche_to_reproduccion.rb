class AddIndLecheToReproduccion < ActiveRecord::Migration[5.0]
  def change
    add_column :reproduccions, :ind_leche, :decimal
  end
end
