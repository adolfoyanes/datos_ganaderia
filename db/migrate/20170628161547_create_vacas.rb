class CreateVacas < ActiveRecord::Migration[5.0]
  def change
    create_table :vacas do |t|
      t.integer :id_2
      t.integer :anonac
      t.string :padre
      t.integer :nropar
      t.decimal :grupo_racial
      t.string :tipser
      t.string :toroas
      t.string :diagno
      t.date :fparto
      t.string :becerro
      t.string :sexo
      t.decimal :pesonacer
      t.decimal :pesodestete
      t.decimal :peso18

      t.timestamps
    end
  end
end
