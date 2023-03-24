class ChangeForm < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :your_name, :string
    add_column :products, :phone_number, :integer
    add_column :products, :starting_bid, :integer, default:0
    add_column :products, :expected_bid, :integer, default:0
    add_column :products, :bank_account, :integer, default:0
  end
end
