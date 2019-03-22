class RemoveLocalisationFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :assos, :localisation, :string
  end
end
