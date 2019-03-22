class AddAssociationAssoToSubscription < ActiveRecord::Migration[5.2]
  def change
    add_reference :subscriptions, :asso, index: true
    add_column :subscriptions, :stripe_customer_id, :string
  end
end
