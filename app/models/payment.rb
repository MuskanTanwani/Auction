class Payment < ApplicationRecord
  belongs_to :user

  def self.adding_data(bid_id,state)
    bid = Bid.find_by_id(bid_id)
    payment = Payment.new
    payment.Seller_Name = bid.product.your_name
    payment.Purchased_Price = bid.current_bid
    payment.Product_Name = bid.product.name
    payment.created_at = Time.now
    payment.updated_at = Time.now
    payment.Bidder_Name = bid.user.email
    payment.user_id = bid.user_id
    if state == "1"
      payment.status = "Completed"
    else 
      payment.status = "Failed"
    end
    payment.save
  end
end
