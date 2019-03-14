class Asso < ApplicationRecord
validates :name, presence: true
validates :description, presence: true, length: {in: 20..2000}
validates :name, presence: true #uniqueness: true

belongs_to :owner, class_name: "User"
has_one :subscription
has_many_attached :picture

geocoded_by :address
after_validation :geocode
end
