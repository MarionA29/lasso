require 'rails_helper'

RSpec.describe PrivateMessage, type: :model do

before(:each) do
@sender = User.create(email: Faker::Internet.email, password: Faker::Space.agency)
@recipient = User.create(email: Faker::Internet.email, password: Faker::Space.agency)
@private_message = PrivateMessage.create(sender_id: @sender.id, recipient_id: @recipient.id, content: Faker::ChuckNorris.fact)
end

context "validation" do
  it "is valid with valid attributes" do
    expect(@private_message).to be_a(PrivateMessage)
    expect(@private_message).to be_valid
  end
end

context "associations" do
    it { should belong_to(:sender).class_name('User')}
    it { should belong_to(:recipient).class_name('User')}

    end
end
