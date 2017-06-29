class AddLactanciaToPesajes < ActiveRecord::Migration[5.0]
  def change
    add_column :pesajes, :lactancia, :integer
  end
end
