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
            respond_to do |format|
                  if @product.save 
                        flash[:success] = "Tạo sản phẩm thành công"  
                        
                        format.html {render inline: "window.history.back();"} 
                  else 
                        flash[:danger] = 'Lỗi xảy ra'
                        format.js {}
                  end 
            end
      end   

      def edit 
            @product = Product.find(params[:id])
      end

      def update 
            @product = Product.find(params[:id])
            respond_to do |format|
                  if @product.update_attributes(product_params)
                        if params[:product][:image].present?
                        @product.image.purge
                        @product.image.attach(params[:restaurant][:image])
                        end
                        format.html {render inline: "window.history.back();"}
                        flash[:success] = "Cập nhật thông tin thành công"
                  else 
                        format.js {render 'create.js.erb'}
                        flash[:danger] = "Có lỗi xảy ra"
                  end
            end
      end

      def destroy
            @product = Product.find(params[:id])
            if @product.destroy 
                  flash[:success] = "Xóa thành công"
                  redirect_back(fallback_location: admin_res_danh_sach_mon_an_path)
            else 
                  redirect_back(fallback_location: admin_res_path)
                  flash[:danger] = "Có lỗi xảy ra"
            end
      end
      private 

      def product_params 
            params.require(:product).permit(:name, :description, :price, :product_type_id)
      end
end
