class AdminShippersController < ApplicationController
      def index 
            @orders = Order.where("shipper_id = ? AND order_type_id = 2", current_user.id).order('updated_at DESC')
      end

      def list_order
            @orders = Order.where("shipper_id = ?", current_user.id).order('updated_at DESC')
      end
end
