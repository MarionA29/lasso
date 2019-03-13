class ChangeReferencesOwnerToAsso < ActiveRecord::Migration[5.2]
  def up
  change_table :subscriptions do |t|
    t.references :asso, index: true
    end
  end

  def down
  change_table :subscriptions do |t|
    t.remove_reference(:owner, index: true)
    end
  end
end
