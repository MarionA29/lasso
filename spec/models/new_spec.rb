require 'rails_helper'

RSpec.describe New, type: :model do

before(:each) do
@owner = User.create(email: Faker::Internet.email, password: Faker::Space.agency)
@asso = Asso.create(name: Faker::Lorem.characters(6), description: Faker::ChuckNorris.fact, owner_id: @owner.id)
@new = New.create(title: Faker::Lorem.characters(6), content: Faker::Lorem.characters(20), date: Faker::Time.between(DateTime.now - 1, DateTime.now), asso_id: @asso.id)
end

context "validation" do
  it "is valid with valid attributes" do
    expect(@new).to be_a(New)
    expect(@new).to be_valid
  end
end

context "associations" do
    it { should belong_to(:asso)}
    end

end
