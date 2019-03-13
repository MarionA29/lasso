class ChangeReferencesOwnerToAsso < ActiveRecord::Migration[5.2]
  def up
  change_table :subscriptions do |t|
    t.remove_references :owner, index: true
    end
  end
end
