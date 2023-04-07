class ChangingBids < ActiveRecord::Migration[6.1]
  def change
    change_column :bids, :current_bid, :integer, using: 'current_bid::integer'
    add_column :bids, :account, :string
  end
end
