class CreateAssos < ActiveRecord::Migration[5.2]
  def change
    create_table :assos do |t|
      t.string :name
      t.text :description
      t.text :chiffres_cle
      t.text :infos_pratiques
      t.references :owner, index: true

      t.timestamps
    end
  end
end
