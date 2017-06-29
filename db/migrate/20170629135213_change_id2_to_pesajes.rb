class ChangeId2ToPesajes < ActiveRecord::Migration[5.0]
  def change
  	change_column :pesajes, :id_2, :string
  end
end
