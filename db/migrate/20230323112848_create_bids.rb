class CreateBids < ActiveRecord::Migration[6.1]
  def change
    create_table :bids do |t|
      t.string :status
      t.string :time
      t.string :current_bid

      t.timestamps
    end
  end
end
