class AdminShippersController < ApplicationController

      before_action :check_user

      def index 
            @orders = Order.where("shipper_id = ? AND order_type_id = 2", current_user.id).order('updated_at DESC')
      end

      def list_order
            @orders = Order.where("shipper_id = ?", current_user.id).order('updated_at DESC')
      end

      private
      def check_user
            if logged_in?
                  unless current_user.role.id == 3
                        redirect_to root_path
                  end     
            end
      end
end
