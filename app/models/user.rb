class User < ApplicationRecord
validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "email adress please" }
has_one :asso, foreign_key: 'owner_id', class_name: 'Asso'
has_one :subscription, foreign_key: 'owner_id', class_name: 'Asso', through: :asso
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

has_one_attached :profile_pic



def avatar
    return self.profile_pic.variant(resize: '200x200')
  end

end
