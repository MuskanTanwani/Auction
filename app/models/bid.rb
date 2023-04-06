class Bid < ApplicationRecord
  belongs_to :product
  belongs_to :user

  def bidaccept 
    self.status = true
    self.save
  end

  def self.valid(bid)
    @initial_price = Product.find_by_id(bid.product_id).starting_bid

    if bid.current_bid.present? && bid.current_bid > @initial_price && bid.current_bid > ApplicationRecord.maximum_bid(bid.product_id)
      return true
    else
      return false
    end
  end

end
