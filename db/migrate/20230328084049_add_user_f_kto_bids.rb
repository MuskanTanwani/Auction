class AddUserFKtoBids < ActiveRecord::Migration[6.1]
  def change
    add_reference :bids, :user, foreign_key: true
  end
end
