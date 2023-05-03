class BidsController < ApplicationController

  before_action :authenticate_user!

  def index 
    @bids = Bid.where(product_id: params[:product_id]).order(current_bid: :desc)
  end

  def show 
    @bids = current_user.bids.order(current_bid: :desc)
  end

  def new 
    @bid = current_user.bids.new
  end

  def create
    @bid = current_user.bids.new(product_id:product_param[:product_id],current_bid:bid_params[:current_bid])
    
    if Bid.valid(@bid)
      @bid.save
      redirect_to product_bids_path, flash:{ notice:"Bid has been Created, Thanks!"}
    else 
      redirect_to new_product_bid_path, flash:{ alert:"Please enter a valid Bid!"}
    end
  end

  def accept 
    @bid = Bid.find_by_id(params[:id])
    @bid.bidaccept
    redirect_to home_index_path, flash:{ notice:"Bid has been Accepted, Thanks!"}
  end

  def bid_accept_by_buyer 
    bid = Bid.find_by_id(params[:id])
    @email = bid.product.user.email

    #  To change the price with current bid
    product = Product.find_by_id(bid.product_id)
    product.price = bid.current_bid
    product.save

    # bid.product.price = bid.current_bid
    GuestJob.perform_later(@email)
    redirect_to home_index_path, flash:{ notice:"Item has been Purchased, Thanks!"}
  end

  def won 
    bid = current_user.bids.all
    @bid = bid.where(status: true)
  end

  def purchased_items 
    @item = current_user.bids.where(status: true)
  end

  def rejected 
    bid = current_user.bids.all
    @bid = bid.where(rejection: true)
  end

  def sold_items 
    @items = current_user.products.where.not(price: nil)
  end

  private

  def bid_params
    params.require(:bid).permit(:current_bid,:product_id)
  end

  def product_param
    params.permit(:product_id)
  end
end
