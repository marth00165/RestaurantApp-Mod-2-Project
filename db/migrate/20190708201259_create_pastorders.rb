class CreatePastorders < ActiveRecord::Migration[5.2]
  def change
    create_table :pastorders do |t|

      t.timestamps
    end
  end
end
