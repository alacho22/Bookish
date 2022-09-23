class Book < ApplicationRecord
  has_many :copies
  has_one_attached :cover_image
  validates :title, presence: true, length: { minimum: 1 }
  validates :author, presence: true, length: { minimum: 1 }
  validates :ISBN, presence: true
  validates :cover_image, presence: true
  # validates_format_of :ISBN, with: /\d{10}|\d{13}/
end
