class Order < ApplicationRecord
    has_many :food_orders
    has_many :foods, through: :food_orders
    has_many :drink_orders
    has_many :drinks, through: :drink_orders
    belongs_to :user
end
