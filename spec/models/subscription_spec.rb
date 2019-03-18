require 'rails_helper'

RSpec.describe Subscription, type: :model do

before(:each) do
@owner = User.create(email: Faker::Internet.email, password: Faker::Space.agency)
@asso = Asso.create(name: Faker::Lorem.characters(6), description: Faker::ChuckNorris.fact, owner_id: @owner.id)
@subscription = Subscription.create(asso_id: @asso.id)
end

context "validation" do
  it "is valid with valid attributes" do
    expect(@subscription).to be_a(Subscription)
    expect(@subscription).to be_valid
  end
end

context "associations" do
    it { should belong_to(:asso)}
    end

end
