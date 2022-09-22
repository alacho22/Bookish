class Copy < ApplicationRecord
  belongs_to :book
  # can when updating or creating due date it must be no more than 2 years in the future
  validates :due_date, inclusion: { in: ->(date) { (Date.today..Date.today + 2.years) } }
  # if one of due date or borrower is present then both must be
  validates :due_date, presence: true, unless: ->(copy) { !copy.borrower.present? }
  validates :borrower, presence: true, unless: ->(copy) { !copy.due_date.present? }
end
