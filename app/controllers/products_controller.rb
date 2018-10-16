class ProductsController < ApplicationController

      def index
            
      end 

      def show
      end 


      def new 
            @product = Product.new 
      end 

      def create 
            @product = Product.create(product_params)
            @product.image.attach(params[:product][:image])
            @product.restaurant_id = current_user.restaurant.id 
            if @product.save 
                  flash[:success] = "Tạo sản phẩm thành công"
                  redirect_to root_path
            else 
                  flash[:danger] = 'Lỗi xảy ra'
                  render 'new'
            end 
      end   


      private 

      def product_params 
            params.require(:product).permit(:name, :description, :price, :product_type_id)
      end
end
