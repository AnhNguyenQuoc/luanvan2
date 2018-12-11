class OrdersController < ApplicationController

      before_action :current_cart

      def create 
            if stripe_params["stripeEmail"] && stripe_params["stripeToken"]
                  @order = Order.new order_params
                  customer = Stripe::Customer.create email: stripe_params["stripeEmail"], card: stripe_params["stripeToken"]
                  order = Order.last.id + 1 if Order.count > 0
                  @total_price = 0
                  if params[:order][:code1].present?
                        @total_price = @current_cart.total_price - ((@current_cart.total_all_price * params[:order][:code1].to_i)/100)
                        @order.total = @total_price
                  else 
                        @order.total = @current_cart.total_price
                  end
                  total_price_after_discount = @total_price + @current_cart.total_ship
                  Stripe::Charge.create customer: customer.id,
                                                amount: total_price_after_discount,
                                                description: "Mã đơn hàng #{order}",
                                                currency: 'vnd'
                  @order.add_line_item_from_cart(@current_cart)
                  @order.buyer = current_user
                  #@order.total = @current_cart.total_price 
                  @order.feeship = @current_cart.total_ship
                  @order.save 
                  flash[:success] = "Đặt hàng thành công"
                  @current_cart.destroy
                  redirect_to cua_hang_path
            else
                  @order = Order.new(order_params)
                  @order.add_line_item_from_cart(@current_cart)
                  @order.buyer = current_user
                  if params[:order][:code].present?
                        total = @current_cart.total_price - ((@current_cart.total_all_price * params[:order][:code].to_i)/100)
                        @order.total = total
                  else 
                        @order.total = @current_cart.total_price
                  end
                   
                  @order.feeship = @current_cart.total_ship
                  if @order.save
                        flash[:success] = "Đặt hàng thành công"
                        @current_cart.destroy
                        redirect_to cua_hang_path
                  else 
                        flash[:danger] = "Có lỗi xảy ra"
                        redirect_to request.referrer
                  end
            end
      end 

      def change_status
            @order = Order.find(params[:id])
            @order.update_attributes(:order_type_id => 2)   
            redirect_back fallback_location: root_path
      end

      def change_status_destroy
            @order = Order.find(params[:id])
            @order.update_attributes(:order_type_id => 4)   
            redirect_back fallback_location: root_path
      end


      def destroy 
            @order = Order.find(params[:id])
            @order.destroy 
            flash[:success] = "Xóa thành công"
             redirect_back fallback_location: root_path
      end

      def update_shipper
            @order = Order.find(params[:id])
            @order.update_attribute(:shipper_id, params[:order][:shipper_id])
            @order.update_attribute(:order_type_id, 5)
            flash[:success] = "Cập nhật Shipper thành công"
            redirect_to  admin_danh_sach_don_hang_path
      end
      
      def update_complete
            @order = Order.find(params[:id])
            @order.update_attribute(:order_type_id, 3)
            flash[:success] = "Hoàn tất đơn hàng"
            redirect_to admin_shipper_path
      end

      private

      def stripe_params
            params.permit :stripeEmail, :stripeToken
      end

      def order_params
            params.require(:order).permit(:note, :payments, :order_type_id)
      end
end
