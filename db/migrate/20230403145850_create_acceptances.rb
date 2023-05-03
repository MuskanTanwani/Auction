class CreateAcceptances < ActiveRecord::Migration[6.1]
  def change
    create_table :acceptances do |t|

      t.timestamps
    end
  end
end
