class PaymentController < ApplicationController
    before_action :authenticate_user!
  
    def transaction
      @payments = current_user.payments.all
    end
    
end
  