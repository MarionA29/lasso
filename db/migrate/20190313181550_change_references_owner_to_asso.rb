class ChangeReferencesOwnerToAsso < ActiveRecord::Migration[5.2]
  def up
  change_table :subscriptions do |t|
    t.references :asso, index: true
    t.remove :owner, index: true
    end
  end
end
