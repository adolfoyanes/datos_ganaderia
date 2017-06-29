class CreatePesajes < ActiveRecord::Migration[5.0]
  def change
    create_table :pesajes do |t|
      t.integer :id_2
      t.date :parto
      t.date :pesaje
      t.integer :del
      t.decimal :lvd
      t.integer :raza

      t.timestamps
    end
  end
end
