class User < ApplicationRecord
validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "email adress please" }
has_one :asso, foreign_key: 'owner_id', class_name: 'Asso'
has_one :subscription, foreign_key: 'owner_id', class_name: 'Asso', through: :asso
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
before_create :set_default_profile_pic
after_create :welcome_send
has_one_attached :profile_pic





def welcome_send
  UserMailer.welcome_email(self).deliver_now
  AdminMailer.new_user_email(self).deliver_now

end

  def set_default_profile_pic
    downloaded_image = (open('https://loremflickr.com/320/240'))
    self.profile_pic.attach(io: downloaded_image, filename: 'image.png')

end

end
