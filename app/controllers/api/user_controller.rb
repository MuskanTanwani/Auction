module Api
class UserController < ApplicationController
  skip_before_action :verify_authenticity_token
  def data
    # byebug
    users = User.all
    render json: users
  end

  def user_bids 
    bids = Bid.where(user_id: params[":id"])
    # byebug
    if bids.present?
      render json: bids
    else
      render json: { error: 'unauthorized' }, status: 404 
    end
  end

  def user_data_update 
    @user = User.find_by_id(params[":id"])
    if @user.present? && @user.update(user_params)
      render json: {message: 'Successfully Updated!'}, status: 200
    else 
      render json: {error: 'Unauthorized' }, status: 404
    end
  end

  private 

  def user_params 
    params.require(:user).permit(:email, :password, :stripe_id)
  end

end 
end
