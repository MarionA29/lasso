class New < ApplicationRecord
  belongs_to :asso
  has_one_attached :news_picture
end
