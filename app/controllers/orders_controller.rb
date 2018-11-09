class OrdersController < ApplicationController

      before_action :current_cart

      def create 
            if stripe_params["stripeEmail"] && stripe_params["stripeToken"]
                  @order = Order.new order_params
                  customer = Stripe::Customer.create email: stripe_params["stripeEmail"], card: stripe_params["stripeToken"]
                  order = Order.last.id + 1 if Order.count > 0
                  Stripe::Charge.create customer: customer.id,
                                                amount: @current_cart.total_all_price,
                                                description: "Mã đơn hàng #{order}",
                                                currency: 'vnd'
                  @order.add_line_item_from_cart(@current_cart)
                  @order.buyer = current_user
                  @order.total = @current_cart.total_price 
                  @order.feeship = @current_cart.total_ship
                  @order.save 
                  flash[:success] = "Đặt hàng thành công"
                  @current_cart.destroy
                  redirect_to cua_hang_path
            else
                  @order = Order.new(order_params)
                  @order.add_line_item_from_cart(@current_cart)
                  @order.buyer = current_user
                  @order.total = @current_cart.total_price 
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


      def destroy 
            @order = Order.find(params[:id])
            @order.destroy 
            flash[:success] = "Xóa thành công"
             redirect_back fallback_location: root_path
      end

      def update_shipper
            @order = Order.find(params[:id])
            @order.update_attribute(:shipper_id, params[:order][:shipper_id])
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
