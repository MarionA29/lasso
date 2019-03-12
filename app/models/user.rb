class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :asso, foreign_key: 'owner_id', class_name: 'Asso'
  has_one :subscription, foreign_key: 'owner_id', class_name: 'Subscription'
end
