class CreateTableCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      t.integer :card_no
      t.integer :sec_code
      t.integer :pin
      t.integer :user_id
    end
  end
end
