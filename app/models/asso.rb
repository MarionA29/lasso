class Asso < ApplicationRecord
validates :name, presence: true
validates :description, presence: true, length: {in: 20..2000}
belongs_to :owner, class_name: "User"
has_one :subscription

has_many_attached :picture
end
