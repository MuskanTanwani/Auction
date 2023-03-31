class BidsController < ApplicationController

  before_action :authenticate_user!

  def index 
    @bids = Bid.all.where(product_id: params[:product_id]).order(current_bid: :desc)
  end

  def show 
    @bids = current_user.bids.all
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
    @bid = Bid.find(params[:id])
    @bid.bidaccept
    redirect_to home_index_path, flash:{ notice:"Bid has been Accepted, Thanks!"}
  end

  def won 
    @bid = Bid.all.where(user_id: current_user.id)
    @bid = Bid.all.where(status: true)
  end

  private

  def bid_params
    params.require(:bid).permit(:current_bid,:product_id)
  end

  def product_param
    params.permit(:product_id)
  end
end
