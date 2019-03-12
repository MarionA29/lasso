class Asso < ApplicationRecord
validates :name, presence: true, #uniqueness: true
validates :description, presence: true, length: {in: 20..2000}
belongs_to :owner, class_name: "User"


has_many_attached :picture
end
