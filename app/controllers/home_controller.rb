class HomeController < ApplicationController
  def index
    @bids = Product.all
  end
end
