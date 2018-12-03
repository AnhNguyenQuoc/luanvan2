class ProductTypesController < ApplicationController
      def index
            @product_types = ProductType.all
      end

      def new 
            @product_type = ProductType.new 
      end 

      def create 
            @product_type = ProductType.new(product_type_params)
            respond_to do |format| 
                  if @product_type.save 
                        flash[:success] = "Tạo sản phẩm thành công"
                        format.js {render inline: "window.history.back();" }
                  else 
                        format.js {}
                        flash[:danger] = "Có lỗi xảy ra"
                  end
            end
      end 

      def edit 
            @product_type = ProductType.find(params[:id])
      end 

      def update 
            @product_type = ProductType.find(params[:id])
            respond_to do |format|
                  if @product_type.update_attributes(product_type_params)
                        format.js {render inline: "window.history.back();" }
                        flash[:success] = "Cập nhật thành công"
                  else 
                        format.js {render 'create.js.erb'}
                        flash[:danger] = "Có lỗi xảy ra"
                  end 
            end

      end 


      def destroy
            @product_types = ProductType.all
            @product_type = ProductType.find(params[:id])
            @product_type.destroy 
            flash[:success] = "Xóa thành công"
            respond_to do |format|
                  format.js { render 'index.js.erb' }
            end
      end
      private

      def product_type_params
            params.require(:product_type).permit(:name)
      end
end
