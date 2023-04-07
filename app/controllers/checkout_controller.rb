class CheckoutController < ApplicationController
  before_action :authenticate_user!

  def create
    respond_to do |format|
      format.js
    end
  end
    # bid = Bid.find_by_id(params[:id])
    # product = Product.find_by_id(bid.product_id) 
    # session = Stripe::Checkout::Session.create({
    #     payment_method_types: ['card'],
    #     line_items: [{
    #         price_data: {currency: 'inr', product_data: {name: product.name}, unit_amount: bid.current_bid},
    #         quantity: product.quantity,
    #     }],
    #     mode: 'payment',
    #     success_url: 'https://google.com',
    #     cancel_url: 'https://google.com',
    #   })
    #   respond_to do |format|
    #     format.js
    #   end
    def create_card
      respond_to do |format|
        if current_user.stripe_id.nil?
          customer = Stripe::Customer.create({"email": current_user.email}) 
          #here we are creating a stripe customer with the help of the Stripe library and pass as parameter email. 
          current_user.update(:stripe_id => customer.id)
          #we are updating current_user and giving to it stripe_id which is equal to id of customer on Stripe
        end
  
        card_token = params[:stripeToken]
        #it's the stripeToken that we added in the hidden input
        if card_token.nil?
          format.html { redirect_to billing_path, error: "Oops"}
        end
        #checking if a card was giving.
  
        customer = Stripe::Customer.new current_user.stripe_id
        customer.source = card_token
        #we're attaching the card to the stripe customer
        # customer.save
  
        format.html { redirect_to purchase_item_path(params[:id]) }
      end
    end

end