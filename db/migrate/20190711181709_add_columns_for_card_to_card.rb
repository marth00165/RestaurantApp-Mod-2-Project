class AddColumnsForCardToCard < ActiveRecord::Migration[5.2]
  def change
    add_column :cards, :exp_year, :integer
    add_column :cards, :exp_month, :integer
    add_column :cards, :noc, :string
    remove_column :cards, :pin, :string
  end
end
