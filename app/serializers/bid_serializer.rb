class BidSerializer < ActiveModel::Serializer 
  include ApplicationHelper
  attributes :id, :current_bid, :product_id, :type

  def type 
    if bid_accept_check(object) 
      type = "Won"
    elsif object.rejection == true 
      type = "Bid Rejected by Bidder"
    elsif bid_reject_check(object)
      type = "Closed"
    else
      type = "Open for Auction"
    end 
  end
end
