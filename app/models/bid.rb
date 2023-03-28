class Bid < ApplicationRecord
  # validates :current_bid, presence: true, if: :check 

  # def check
  #   current_bid >.maximum(:current_bid)
  # end
  belongs_to :product
  belongs_to :user
end
