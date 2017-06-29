class ChangeRazaToPesaje < ActiveRecord::Migration[5.0]
  def change
  	change_column :pesajes, :raza, :string
  end
end
