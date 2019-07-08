class CreateTableFoodOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :food_orders do |t|
      t.integer :food_id
      t.integer :order_id
      t.integer :spicy
      t.integer :quantity
    end
  end
end
