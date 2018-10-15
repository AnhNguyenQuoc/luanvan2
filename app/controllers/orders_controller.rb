class OrdersController < ApplicationController

      before_action :current_cart

      def create 
            @order = Order.new(order_params)
            @order.add_line_item_from_cart(@current_cart)
            @order.buyer = current_user
            @order.total = @current_cart.total_price 
            @order.feeship = @current_cart.total_ship
            if @order.save
                  flash[:success] = "Đặt hàng thành công"
                  @current_cart.destroy
                  redirect_to restaurants_path
            else 
                  flash[:danger] = "Có lỗi xảy ra"
                  redirect_to request.referrer
            end
      end 


      private

      def order_params
            params.require(:order).permit(:note, :payments)
      end
end
