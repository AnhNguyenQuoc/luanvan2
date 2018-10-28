class AdminsController < ApplicationController

      def index
            @restaurants = Restaurant.all.count
            @total = Order.where('order_type_id = 3').sum(:feeship)
            @total_users = User.all.count
            @order_per_day = Order.group_by_day(:created_at).count 
            @order_per_month = Order.group_by_month(:created_at).count 
            @order_per_year = Order.group_by_year(:created_at).count 
            @users = User.order('created_at DESC').limit(5)
      end


      def statistic_total
            @total_per_day = Order.where("orders.order_type_id = 3").group_by_day('orders.created_at').sum(:feeship)
            @total_per_month =  Order.where("orders.order_type_id = 3").group_by_month('orders.created_at').sum(:feeship)
            @total_per_year =  Order.where("orders.order_type_id = 3").group_by_year('orders.created_at').sum(:feeship)
      end 

      def list_restaurants
           @restaurants = Restaurant.all
      end

      
end
