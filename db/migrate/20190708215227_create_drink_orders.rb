class CreateDrinkOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :drink_orders do |t|
      t.integer :drink_id
      t.integer :order_id
      t.string :size
      t.integer :quantity

      t.timestamps
    end
  end
end
