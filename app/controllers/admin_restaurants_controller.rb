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
            @orders = Order.joins(:products).where("products.restaurant_id = ?", current_user.restaurant.id).group("orders.id").order('created_at DESC')
      end
      
      def list_product
            if params[:search]
                  @products = current_user.restaurant.products.search(params[:search]).page params[:page]
            else
                  @products = current_user.restaurant.products.page params[:page]
            end   
      end

      def statistic_orders_by_day
            
            if params[:day].present?
                  @orders = Order.from(Order.joins(:products).distinct(true).where("products.restaurant_id = ?", current_user.restaurant.id).by_day("#{params[:day]}"), :a).joins("INNER JOIN order_types ON order_types.id = a.order_type_id").group("order_types.name").count
            else 
                  @orders = Order.from(Order.joins(:products).distinct(true).where("products.restaurant_id = ?", current_user.restaurant.id).by_day(Date.today), :a).joins("INNER JOIN order_types ON order_types.id = a.order_type_id").group("order_types.name").count
            end
      end

      def statistic_orders_by_month
            if params[:month].present?
                  @orders = Order.from(Order.joins(:products).distinct(true).where("products.restaurant_id = ?", current_user.restaurant.id).by_month("#{params[:month]["written_on(2i)"]}"), :a).joins("INNER JOIN order_types ON order_types.id = a.order_type_id").group("order_types.name").count
            else 
                  @orders = Order.from(Order.joins(:products).distinct(true).where("products.restaurant_id = ?", current_user.restaurant.id).by_month(Date.today), :a).joins("INNER JOIN order_types ON order_types.id = a.order_type_id").group("order_types.name").count
            end
      end

      def statistic_orders_by_year
            if params[:year].present?
                  @orders = Order.from(Order.joins(:products).distinct(true).where("products.restaurant_id = ?", current_user.restaurant.id).by_year("#{params[:year]["written_on(1i)"]}"), :a).joins("INNER JOIN order_types ON order_types.id = a.order_type_id").group("order_types.name").count
            else 
                  @orders = Order.from(Order.joins(:products).distinct(true).where("products.restaurant_id = ?", current_user.restaurant.id).by_year(Date.today), :a).joins("INNER JOIN order_types ON order_types.id = a.order_type_id").group("order_types.name").count
            end
      end

      def pdf_day 
            if params[:day].present?
                  @total_per_day = Order.joins(:products).distinct(true).where("orders.order_type_id = 3 AND products.restaurant_id = ?", current_user.restaurant.id).by_day("#{params[:day]}")
                  respond_to do |format|
                        format.pdf do 
                              pdf = TotalPdf.new(@total_per_day, params[:day], view_context)
                              send_data pdf.render, filename: "Order_#{params[:day]}.pdf",
                                                type: "application/pdf",
                                                disposition: "inline"
                        end 
                  end
            else 
                  @total_per_day = Order.joins(:products).distinct(true).where("orders.order_type_id = 3 AND products.restaurant_id = ?", current_user.restaurant.id).by_day(Date.today)
                  respond_to do |format|
                        format.pdf do 
                              pdf = TotalPdf.new(@total_per_day, Date.today.strftime("%e/%m/%Y"), view_context)
                              send_data pdf.render, filename: "Order_#{Date.today.strftime("%e/%m/%Y")}.pdf",
                                                type: "application/pdf",
                                                disposition: "inline"
                        end 
                  end
            end
      end

      def pdf_month
            if params[:month].present?
                  @total_per_month = Order.joins(:products).distinct(true).where("orders.order_type_id = 3 AND products.restaurant_id = ?", current_user.restaurant.id).by_month("#{params[:month]["written_on(2i)"]}")
                  respond_to do |format|
                        format.pdf do 
                              pdf = TotalPdf.new(@total_per_month, params[:month]["written_on(2i)"], view_context)
                              send_data pdf.render, filename: "Order_Tháng #{params[:month]["written_on(2i)"]}.pdf",
                                                type: "application/pdf",
                                                disposition: "inline"
                        end 
                  end
            else 
                  @total_per_month = Order.joins(:products).distinct(true).where("orders.order_type_id = 3 AND products.restaurant_id = ?", current_user.restaurant.id).by_month(Date.today)
                  respond_to do |format|
                        format.pdf do 
                              pdf = TotalPdf.new(@total_per_month, Date.today.strftime("%m"), view_context)
                              send_data pdf.render, filename: "Order_Tháng #{Date.today.strftime("%m")}.pdf",
                                                type: "application/pdf",
                                                disposition: "inline"
                        end 
                  end
            end
      end

      def pdf_year
            if params[:year].present?
                  @total_per_year = Order.joins(:products).distinct(true).where("orders.order_type_id = 3 AND products.restaurant_id = ?", current_user.restaurant.id).by_year("#{params[:year]["written_on(1i)"]}")
                  respond_to do |format|
                        format.pdf do 
                              pdf = TotalPdf.new(@total_per_year, params[:year]["written_on(1i)"], view_context)
                              send_data pdf.render, filename: "Order_Năm#{params[:year]["written_on(1i)"]}.pdf",
                                                type: "application/pdf",
                                                disposition: "inline"
                        end 
                  end
            else 
                  @total_per_year = Order.joins(:products).distinct(true).where("orders.order_type_id = 3 AND products.restaurant_id = ?", current_user.restaurant.id).by_year(Date.today)
                  respond_to do |format|
                        format.pdf do 
                              pdf = TotalPdf.new(@total_per_year, Date.today.strftime("%Y"), view_context)
                              send_data pdf.render, filename: "Order_Năm #{Date.today.strftime("%Y")}.pdf",
                                                type: "application/pdf",
                                                disposition: "inline"
                        end 
                  end
            end
      end

      def edit_admin_restaurant
            @user = User.find(current_user.id)
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
