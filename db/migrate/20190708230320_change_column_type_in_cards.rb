class ChangeColumnTypeInCards < ActiveRecord::Migration[5.2]
  def change
    change_column(:cards, :card_no, :string)
  end
end
