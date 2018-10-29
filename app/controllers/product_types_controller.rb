class ProductTypesController < ApplicationController
      def index
            @product_types = ProductType.all
      end

      def new 
            @product_type = ProductType.new 
      end 

      def create 
            @product_type = ProductType.new(product_type_params)
            if @product_type.save 
                  redirect_to admin_loai_thuc_an_path
                  flash[:success] = "Tạo sản phẩm thành công"
            else 
                  render 'new'
                  flash[:danger] = "Có lỗi xảy ra"
            end
      end 

      def edit 
            @product_type = ProductType.find(params[:id])
      end 

      def update 
            @product_type = ProductType.find(params[:id])
            if @product_type.update_attributes(product_type_params)
                  redirect_to admin_loai_thuc_an_path
                  flash[:success] = "Cập nhật thành công"
            else 
                  render 'edit'
                  flash[:danger] = "Có lỗi xảy ra"
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
