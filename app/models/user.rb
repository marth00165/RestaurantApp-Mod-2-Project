class User < ApplicationRecord
  validates :username, uniqueness: true
  validates :age, numericality: true
  has_secure_password
    has_many :orders
    has_many :cards
    def fav_order #returns the most ordered meal for a user
      @orders = self.orders
      @orders = @orders.select{|order| order.complete == true}
      @orders = @orders.sort.reverse #sorts by most recent order first
      order_num = 0
      temp_num = 0
      @fav_order = @orders.last
      @orders.each do |order|
        @orders.each do |order2|
          if order.foods == order2.foods && order.drinks == order2.drinks && order != order2 #comparing the contents of the two orders
            temp_num += 1 #tracking how many of the same order there is
          end
        end
        if temp_num >= order_num
          order_num = temp_num
          @fav_order = order
          temp_num = 0
        end
      end
      @fav_order#returning the fav order, which is either the most recent if all orders are the same amount or most ordered.
    end
end
