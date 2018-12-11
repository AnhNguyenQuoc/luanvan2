class AdminsController < ApplicationController
      before_action :check_user

      def index
            @restaurants = Restaurant.all.count
            @total = Order.where('order_type_id = 3').sum(:feeship)
            @total_users = User.all.count
            @order_per_day = Order.group_by_day(:created_at).count 
            @order_per_month = Order.group_by_month(:created_at).count 
            @order_per_year = Order.group_by_year(:created_at).count 
            @users = User.order('created_at DESC').limit(5)
      end

      def list_user
            @users = User.where.not(id: current_user.id)
      end

      def update_shipper
            @order = Order.find(params[:id])
      end
      
      def list_order

            @orders = Order.all
      end

      def user_create
            @user = User.new 
      end


      def statistic_total
            @total_per_day = Order.where("orders.order_type_id = 3").group_by_day('orders.updated_at').sum(:feeship)
            @total_per_month =  Order.where("orders.order_type_id = 3").group_by_month('orders.updated_at').sum(:feeship)
            @total_per_year =  Order.where("orders.order_type_id = 3").group_by_year('orders.updated_at').sum(:feeship)
      end 

      def list_restaurants
           @restaurants = Restaurant.all
      end

      def statistic_orders_by_day
            
            if params[:day].present?
                  @orders = Order.by_day("#{params[:day]}").joins("INNER JOIN order_types ON order_types.id = orders.order_type_id").group("order_types.name").count
            else 
                  @orders = Order.by_day(Date.today).joins("INNER JOIN order_types ON order_types.id = orders.order_type_id").group("order_types.name").count
            end
      end

      def statistic_orders_by_month
            if params[:month].present?
                  @orders = Order.by_month("#{params[:month]["written_on(2i)"]}").joins("INNER JOIN order_types ON order_types.id = orders.order_type_id").group("order_types.name").count
            else 
                  @orders = Order.by_month(Date.today).joins("INNER JOIN order_types ON order_types.id = orders.order_type_id").group("order_types.name").count
            end
      end

      def statistic_orders_by_year
            if params[:year].present?
                  @orders = Order.by_year("#{params[:year]["written_on(1i)"]}").joins("INNER JOIN order_types ON order_types.id = orders.order_type_id").group("order_types.name").count
            else 
                  @orders = Order.by_year(Date.today).joins("INNER JOIN order_types ON order_types.id = orders.order_type_id").group("order_types.name").count
            end
      end


      def list_comments
            @comments = Comment.all
      end

      def pdf_by_day_admin
            if params[:day].present?
                  @total_per_day = Order.where("orders.order_type_id = 3").by_day("#{params[:day]}")
                  respond_to do |format|
                        format.pdf do 
                              pdf = TotalAdminPdf.new(@total_per_day, params[:day], view_context)
                              send_data pdf.render, filename: "Order_#{params[:day]}.pdf",
                                                type: "application/pdf",
                                                disposition: "inline"
                        end 
                  end
            else 
                  @total_per_day = Order.where("orders.order_type_id = 3").by_day(Date.today)
                  respond_to do |format|
                        format.pdf do 
                              pdf = TotalAdminPdf.new(@total_per_day, Date.today.strftime("%e/%m/%Y"), view_context)
                              send_data pdf.render, filename: "Order_#{Date.today.strftime("%e/%m/%Y")}.pdf",
                                                type: "application/pdf",
                                                disposition: "inline"
                        end 
                  end
            end
      end 

      def pdf_by_month_admin
            if params[:month].present?
                  @total_per_month = Order.where("orders.order_type_id = 3").by_month("#{params[:month]["written_on(2i)"]}")
                  respond_to do |format|
                        format.pdf do 
                              pdf = TotalAdminPdf.new(@total_per_month, params[:month]["written_on(2i)"], view_context)
                              send_data pdf.render, filename: "Order_Tháng #{params[:month]["written_on(2i)"]}.pdf",
                                                type: "application/pdf",
                                                disposition: "inline"
                        end 
                  end
            else 
                  @total_per_month = Order.where("orders.order_type_id = 3").by_month("#{params[:month]["written_on(2i)"]}")
                  
                  respond_to do |format|
                        format.pdf do 
                              pdf = TotalAdminPdf.new(@total_per_month, Date.today.strftime("%m"), view_context)
                              send_data pdf.render, filename: "Order_Tháng #{Date.today.strftime("%m")}.pdf",
                                                type: "application/pdf",
                                                disposition: "inline"
                        end 
                  end
            end
      end 

      def pdf_by_year_admin
            if params[:year].present?
                  @total_per_year = Order.where("orders.order_type_id = 3").by_year("#{params[:year]["written_on(1i)"]}")
                  respond_to do |format|
                        format.pdf do 
                              pdf = TotalAdminPdf.new(@total_per_year, params[:year]["written_on(1i)"], view_context)
                              send_data pdf.render, filename: "Order_Năm#{params[:year]["written_on(1i)"]}.pdf",
                                                type: "application/pdf",
                                                disposition: "inline"
                        end 
                  end
            else 
                  @total_per_year = Order.where("orders.order_type_id = 3").by_year(Date.today)
                  respond_to do |format|
                        format.pdf do 
                              pdf = TotalAdminPdf.new(@total_per_year, Date.today.strftime("%Y"), view_context)
                              send_data pdf.render, filename: "Order_Năm #{Date.today.strftime("%Y")}.pdf",
                                                type: "application/pdf",
                                                disposition: "inline"
                        end 
                  end
            end
      end

      def edit_admin
            @user = User.find(current_user.id)
      end

      private
      def check_user
            if logged_in?
                  unless current_user.role.id == 4
                        redirect_to root_path
                  end     
            end
      end
      
end
