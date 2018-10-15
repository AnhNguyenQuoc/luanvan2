class LineItemsController < ApplicationController

      before_action :set_line_item, only: [:show, :edit, :update, :destroy]
      before_action :current_cart

     def create
            chosen_product = Product.find(params[:product_id])
            current_cart = @current_cart

            if LineItem.exists?(:cart_id => @current_cart.id, :product_id => chosen_product)
                  @line_item = @current_cart.line_items.find_by(product_id: chosen_product)
                  @line_item.quantity += 1
            else  
                  @line_item = LineItem.new
                  @line_item.cart = @current_cart
                  @line_item.product = chosen_product
            end

            @line_item.save
      
            respond_to do |format|
                  format.js
            end
      end




      def destroy 
            @line_item = LineItem.find(params[:id])
            @line_item.destroy

            respond_to do |format|
                  format.js
            end
      end 

      def add_quantity
            @line_item = LineItem.find(params[:id])
            @line_item.quantity += 1
            @line_item.save

            respond_to do |format|
                  format.js
            end
      end

      def reduce_quantity
            @line_item = LineItem.find(params[:id])
            if @line_item.quantity > 1
                  @line_item.quantity -= 1
            end 

            @line_item.save
             respond_to do |format|
                  format.js
            end
      end

      private

      def set_line_item
            @line_item = LineItem.find(params[:id])
      end 

      def line_item_params 
            params.require(:line_item).permit(:product_id)
      end
end
