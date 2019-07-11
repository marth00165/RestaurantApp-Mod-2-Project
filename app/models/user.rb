class User < ApplicationRecord
  validates :username, uniqueness: true
  validates :age, numericality: true
  has_secure_password
    has_many :orders
    has_many :cards
    def fav_order
      @orders = self.orders
      @orders = @orders.select{|order| order.complete == true}
      @orders.sort
      order_num = 0
      temp_num = 0
      @fav_order = @orders.last
      @orders.each do |order|
        @orders.each do |order2|
          if order.foods == order2.foods && order.drinks == order2.drinks && order != order2
            temp_num += 1
          end
        end
        if temp_num >= order_num
          order_num = temp_num
          @fav_order = order
          temp_num = 0
        end
      end
      @fav_order
    end
end
