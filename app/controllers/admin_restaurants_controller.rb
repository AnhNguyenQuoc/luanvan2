class AdminRestaurantsController < ApplicationController

      before_action :check_user

      def index
           @orders = Order.joins(:products).where("orders.order_type_id = 1 AND products.restaurant_id = ?", current_user.restaurant.id).group('orders.id').length
           @products = current_user.restaurant.products.count
           @total = Order.from(Order.joins(:products).distinct(true).where("orders.order_type_id = 3 AND products.restaurant_id = ?", current_user.restaurant.id), :a).sum("a.total")
           @order = Order.joins(:products).where("products.restaurant_id = ?", current_user.restaurant.id).group('orders.id').order("updated_at desc").limit(5)
      end   

      def statistic_total
            # @orders = Order.joins(:products).distinct(true).where("orders.order_type_id = 3 AND products.restaurant_id = 1")
            @total_per_day = Order.from(Order.joins(:products).distinct(true).where("orders.order_type_id = 3 AND products.restaurant_id = ?", current_user.restaurant.id), :a).group_by_day("a.created_at").sum("a.total")
            @total_per_month = Order.from(Order.joins(:products).distinct(true).where("orders.order_type_id = 3 AND products.restaurant_id = ?", current_user.restaurant.id), :a).group_by_month("a.created_at").sum("a.total")
            @total_per_year = Order.from(Order.joins(:products).distinct(true).where("orders.order_type_id = 3 AND products.restaurant_id = ?", current_user.restaurant.id), :a).group_by_year("a.created_at").sum("a.total")
      end


      def list_order
            @orders = Order.joins(:products).where("products.restaurant_id = ?", current_user.restaurant.id).group("orders.id").order('updated_at DESC')
      end
      
      def list_product
            if params[:search]
                  @products = current_user.restaurant.products.search(params[:search]).page params[:page]
            else
                  @products = current_user.restaurant.products.page params[:page]
            end   
      end

      def statistic_total_by_day
            
            if params[:day].present?
                  @orders = Order.from(Order.joins(:products).distinct(true).where("products.restaurant_id = ?", current_user.restaurant.id).by_day("#{params[:day]}"), :a).joins("INNER JOIN order_types ON order_types.id = a.order_type_id").group("order_types.name").count
            else 
                  @orders = Order.from(Order.joins(:products).distinct(true).where("products.restaurant_id = ?", current_user.restaurant.id).by_day(Date.today), :a).joins("INNER JOIN order_types ON order_types.id = a.order_type_id").group("order_types.name").count
            end
      end

      def statistic_total_by_month
            if params[:month].present?
                  @orders = Order.from(Order.joins(:products).distinct(true).where("products.restaurant_id = ?", current_user.restaurant.id).by_month("#{params[:month]}"), :a).joins("INNER JOIN order_types ON order_types.id = a.order_type_id").group("order_types.name").count
            else 
                  @orders = Order.from(Order.joins(:products).distinct(true).where("products.restaurant_id = ?", current_user.restaurant.id).by_month(Date.today), :a).joins("INNER JOIN order_types ON order_types.id = a.order_type_id").group("order_types.name").count
            end
      end


      private
      def check_user
            if logged_in?
                  unless current_user.role.id == 2
                        redirect_to root_path
                  end     
            end
      end
end
