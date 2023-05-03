class CheckoutController < ApplicationController
  before_action :authenticate_user!

  def create
    respond_to do |format|
      format.js
    end
  end
  
  def create_card
    respond_to do |format|
      if current_user.stripe_id.nil?
        customer = Stripe::Customer.create({"email": current_user.email})
        current_user.update(:stripe_id => customer.id)
      end

      card_token = params[:stripeToken]
  
      if card_token.nil?
        Payment.adding_data(params[:id],"0")
        format.html { redirect_to billing_path, error: "Oops"}
      end
  
      customer = Stripe::Customer.new current_user.stripe_id
      customer.source = card_token
     
      Payment.adding_data(params[:id],"1")
      format.html { redirect_to purchase_item_path(params[:id]) }
    end
  end

end