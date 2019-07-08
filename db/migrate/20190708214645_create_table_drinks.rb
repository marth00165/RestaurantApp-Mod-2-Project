class CreateTableDrinks < ActiveRecord::Migration[5.2]
  def change
    create_table :drinks do |t|
      t.string :name
      t.float :price
      t.string :imgurl
      t.string :desc
    end
  end
end
