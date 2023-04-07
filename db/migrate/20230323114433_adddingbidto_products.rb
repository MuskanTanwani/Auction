class AdddingbidtoProducts < ActiveRecord::Migration[6.1]
  def change
    add_reference :bids, :product, foreign_key: true
  end
end
