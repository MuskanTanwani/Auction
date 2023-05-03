class SetDefaultStatus < ActiveRecord::Migration[6.1]
  def change
    change_column :bids, :status, :boolean, default: :false
  end
end
