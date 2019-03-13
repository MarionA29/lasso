class Asso < ApplicationRecord
<<<<<<< HEAD
validates :name, presence: true
validates :description, presence: true, length: {in: 20..2000}
belongs_to :owner, class_name: "User"
has_one :subscription
=======
>>>>>>> 53ee69c8da53aa8b77f5e4cb9c445fc9401a14e0

  validates :name, presence: true #uniqueness: true

  validates :description, presence: true, length: {in: 20..2000}
  belongs_to :owner, class_name: "User"

  has_many_attached :picture
end
