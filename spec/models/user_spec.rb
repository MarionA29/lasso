require 'rails_helper'

RSpec.describe User, type: :model do

  before(:each) do
  @user = User.create(email: Faker::Internet.email, password: Faker::Space.agency)
  end
context "validation" do
  it "is valid with valid attributes" do
    expect(@user).to be_a(User)
    expect(@user).to be_valid
  end
  describe "#email" do
    it { should validate_presence_of :email }
    it { should validate_presence_of :email }
  end
  describe "#password" do
    it { should validate_presence_of :password}
  end
end

context "associations" do
  it { should have_one(:asso)}
  it { should have_one(:subscription)}
  end

end
