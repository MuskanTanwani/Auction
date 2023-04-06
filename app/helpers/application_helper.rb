module ApplicationHelper
 attr_accessor :toptwo, :seller
  def index_helper 
    if @bids.present? 
      @toptwo = 0 
      @seller = @bids.first.product.user_id
    end
  end

  def index_check(bids) 
    bids.present? && current_user.id == seller && show_helper(bids.first.product_id) == true
  end
  
  def index_accept(bid)
    if toptwo < 2 
       @toptwo += 1 
      button_to 'Accept' , accept_bid_path(bid), method: :put
    end 
  end

  def show_helper(product_id)

    @bid = Bid.where(product_id: product_id).order(current_bid: :desc).first(2)
    
    if @bid.second.present? && (@bid.first.status == true || @bid.second.status == true)
      @show = false                     # Bid had been Accepted
    else 
      @show = true
    end
    return @show
  end

  def bid_accept_check(bid)
    show_helper(bid.product_id) == false && bid.status == true
  end

  def bid_reject_check(bid)
    show_helper(bid.product_id) == false && bid.status == false
  end

end
