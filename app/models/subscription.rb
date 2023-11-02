class Subscription < ApplicationRecord
  belongs_to :tea
  belongs_to :customer

  validates :title, :price, :status, :frequency, presence: true
end