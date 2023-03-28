class Bid < ApplicationRecord
  belongs_to :product
  validates :current_bid,presence: true
end
