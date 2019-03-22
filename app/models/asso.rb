class Asso < ApplicationRecord
  include ActiveModel::Dirty

  validates :name, presence: true
  validates :description, presence: true, length: {in: 20..2000}
  validates :name, presence: true
  belongs_to :owner, class_name: "User"
  has_one :subscription
  has_many :news
  has_one_attached :picture1
  has_one_attached :picture2
  has_one_attached :picture3
  has_one_attached :picture4
  has_one_attached :picture5

  geocoded_by :address
  after_validation :geocode

  def self.search(term)
    if term
      where('name ILIKE ?', "%#{term}%").or(where('address ILIKE ?', "%#{term}%")).or(where('description ILIKE ?', "%#{term}%")).or(where('key_figures ILIKE ?', "%#{term}%"))
    else
      order('id DESC')
    end
  end
  =begin
  after_create :ask_validation

  def ask_validation
  UserMailer.validation_email(self).deliver_now
  AdminMailer.validation_email(self).deliver_now
end

after_

def is_validated?
if @asso.validated == true
UserMailer.subscription_email(self).deliver_now
else
UserMailer.unvalidated_email(self).deliver_now
end

end
=end
end

def resize(picture)
  return picture.variant(resize: '280x190')
end
