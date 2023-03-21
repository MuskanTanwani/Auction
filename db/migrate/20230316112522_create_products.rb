class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name
      t.float :price
      t.integer :quantity
      t.string :comapny_name
      t.string :description

      t.timestamps
    end
  end
end
