class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :From
      t.string :Friends

      t.timestamps
    end
  end
end
