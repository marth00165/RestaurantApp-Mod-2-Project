class AddColumnsForAddressPartsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :city, :string
    add_column :users, :state, :string
    add_column :users, :zip, :integer
    add_column :users, :email, :string
  end
end
