class AddValidatedToAsso < ActiveRecord::Migration[5.2]
  def change
    add_column :assos, :validated, :boolean, default: nil
  end
end
