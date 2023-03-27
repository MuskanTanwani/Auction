class BidsController < ApplicationController

  before_action :authenticate_user!

  def index 
    @bids = Bid.all.where(product_id: params[:id])
  end

  def new 
    @bid = Bid.find_by(product_id: params[:id]).new
  end

  def create
    @bid = Bid.find_by(product_id: params[:id]).new(bid_params)
    if @bid.save
      redirect_to bids_path, flash:{ notice:"Bid has been Created, Thanks!"}
    else 
      render :new
    end
  end

end
