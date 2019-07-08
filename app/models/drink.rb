class Drink < ApplicationRecord
    has_many :drink_orders
    has_many :orders, through: :drink_orders
end
