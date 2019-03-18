require 'rails_helper'

RSpec.describe Asso, type: :model do

before(:each) do
@owner = User.create(email: Faker::Internet.email, password: Faker::Space.agency)
@asso = Asso.create(name: Faker::Lorem.characters(6), description: Faker::ChuckNorris.fact, owner_id: @owner.id)
end

context "validation" do
  it "is valid with valid attributes" do
    expect(@asso).to be_a(Asso)
    expect(@asso).to be_valid
  end
  describe "#title" do
    it { should validate_presence_of(:name) }
  end
  describe "#description" do
    it { should validate_presence_of(:description) }
    it { should validate_length_of(:description).is_at_least(20)}
    it { should validate_length_of(:description).is_at_most(2000)}
  end
end
context "associations" do
    it { should belong_to(:owner).class_name('User')}
    end


end
