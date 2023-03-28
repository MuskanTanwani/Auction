class BidsController < ApplicationController

  before_action :authenticate_user!

  def index 
    @bids = Bid.all.where(product_id: params[:product_id])
    @sortbids = @bids.order(current_bid: :desc)
  end

  def show 
    @bids = current_user.bids.all
  end

  def new 
    @bid = current_user.bids.new
  end

  def create
    @bid = current_user.bids.new(product_id:product_param[:product_id],current_bid:bid_params[:current_bid])
    if @bid.save
      redirect_to product_bids_path, flash:{ notice:"Bid has been Created, Thanks!"}
    else 
      render :new
    end
  end

  def edit
    @bid = Bid.find_by(product_id: params[:product_id], id: params[:id])
    unless @bid.present?
      redirect_to product_bids_path,  flash:{notice:"Bid does not exist"}
    end
  end

  def update 
    @bid = Bid.find_by(product_id: params[:product_id], id: params[:id])

    if @bid.update(bid_params)
      redirect_to product_bids_path, flash:{notice:"Bid Data has been Updated"}
    else 
      render :edit, flash:{notice:"Bid has Not been Updated. Please Verify Details"}
    end
  end

  def destroy
    @bid = Bid.find_by(product_id: params[:product_id], id: params[:id])
    if @bid.destroy
      redirect_to product_bids_path, flash:{notice:"Bid has been deleted.Thanks!"}
    end
  end

  private
  def bid_params
    params.require(:bid).permit(:current_bid,:product_id)
  end
  def product_param
    params.permit(:product_id)
  end
end
