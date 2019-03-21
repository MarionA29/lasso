class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "email adress please" }
  has_one :asso, foreign_key: 'owner_id', class_name: 'Asso'
  has_one :subscription, foreign_key: 'owner_id', class_name: 'Asso', through: :asso
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable

  #after_create :welcome_send
  has_one_attached :profile_pic
  has_many :sent_messages, foreign_key: 'sender_id', class_name: "PrivateMessage"
  has_many :received_messages, foreign_key: 'recipient_id', class_name: "PrivateMessage"
=begin
def welcome_send
  UserMailer.welcome_email(self).deliver_now
  AdminMailer.new_user_email(self).deliver_now
end
=end
  def avatar
    return self.profile_pic.variant(resize: '290x190')
  end

end
