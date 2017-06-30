class CreateReproduccions < ActiveRecord::Migration[5.0]
  def change
    create_table :reproduccions do |t|
      t.string :id_2
      t.date :nacimiento
      t.integer :anonac
      t.string :padre
      t.string :madre
      t.integer :lact
      t.string :id_lact
      t.date :parto
      t.integer :anopart
      t.integer :mesparto
      t.string :cria
      t.string :sexo_cria
      t.string :padre_cria
      t.integer :meses_parto
      t.date :prenez
      t.string :toro_prenez
      t.integer :servicios
      t.date :secado
      t.decimal :lechetotal
      t.integer :del
      t.decimal :acum_305d
      t.string :removida
      t.date :fecha_salida

      t.timestamps
    end
  end
end
