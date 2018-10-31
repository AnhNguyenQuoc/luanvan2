class AdminRestaurantsController < ApplicationController
      def index
           @orders = Order.joins(:products).where("orders.order_type_id = 1 AND products.restaurant_id = ?", current_user.restaurant.id).count('orders.id')
           @products = current_user.restaurant.products.count
           @total = Order.joins(:products).where("orders.order_type_id = 3 AND products.restaurant_id = ?", current_user.restaurant.id).sum(:total)
           @order_per_day = Order.joins(:products).where("products.restaurant_id = ?", current_user.restaurant.id).group_by_day('orders.created_at').count
           @order_per_month = Order.joins(:products).where("products.restaurant_id = ?", current_user.restaurant.id).group_by_month('orders.created_at').count
           @order_per_year = Order.joins(:products).where("products.restaurant_id = ?", current_user.restaurant.id).group_by_year('orders.created_at').count
      end

      def statistic_total
            @total_per_day = Order.joins(:products).where("orders.order_type_id = 3 AND products.restaurant_id = ?", current_user.restaurant.id).group_by_day('orders.created_at').sum(:total)
            @total_per_month = Order.joins(:products).where("orders.order_type_id = 3 AND products.restaurant_id = ?", current_user.restaurant.id).group_by_month('orders.created_at').sum(:total)
            @total_per_year = Order.joins(:products).where("orders.order_type_id = 3 AND products.restaurant_id = ?", current_user.restaurant.id).group_by_year('orders.created_at').sum(:total)
      end


      def list_order
            if params[:uncheck]
                  @orders = Order.joins(:products).where("products.restaurant_id = ?", current_user.restaurant.id).order('updated_at DESC').uncheck.page(params[:page])
            elsif params[:check]
                  @orders = Order.joins(:products).where("products.restaurant_id = ?", current_user.restaurant.id).order('updated_at DESC').check.page(params[:page])
            elsif params[:complete]
                  @orders = Order.joins(:products).where("products.restaurant_id = ?", current_user.restaurant.id).order('updated_at DESC').complete.page(params[:page])
            elsif params[:search]
                  @orders = Order.joins(:products).where("products.restaurant_id = ?", current_user.restaurant.id).order('updated_at DESC').search(params[:search]).page(params[:page])
            else 
                  @orders = Order.joins(:products).where("products.restaurant_id = ?", current_user.restaurant.id).order('updated_at DESC').page(params[:page])
            end
      end
      
      def list_product
            if params[:search]
                  @products = current_user.restaurant.products.search(params[:search]).page params[:page]
            else
                  @products = current_user.restaurant.products.page params[:page]
            end
      end

end
