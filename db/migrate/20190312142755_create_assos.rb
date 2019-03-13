class CreateAssos < ActiveRecord::Migration[5.2]
  def change
    create_table :assos do |t|
      t.string :name
      t.text :description
      t.text :key_figures
      t.text :infos
      t.string :localisation

      t.references :owner, index: true

      t.timestamps
    end
  end
end
