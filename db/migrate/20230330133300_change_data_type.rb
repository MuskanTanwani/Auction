class ChangeDataType < ActiveRecord::Migration[6.1]
  def change
    change_column :bids, :status, :boolean, using: 'current_bid::boolean'
  end
end
