class Book < ApplicationRecord
  validates :title, presence: true, length: { minimum: 1 }
  validates :author, presence: true, length: { minimum: 1 }
  validates :ISBN, presence: true
  validates_format_of :ISBN, with: /[0-9]{10}|[0-9]{13}]/
end
