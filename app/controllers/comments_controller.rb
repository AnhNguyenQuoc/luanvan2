class CommentsController < ApplicationController

      def create
            @restaurant = Restaurant.find(params[:restaurant_id])
            @comment = Comment.new(comment_params)
            @comment.images.attach(params[:comment][:images])
            @comment.user = current_user
            @comment.restaurant = @restaurant
            if @comment.save 
                  flash[:success] = "Đăng bình luận thành công"
                  redirect_to restaurant_comment_path(@restaurant)
            else 
                  flash[:danger] = "Có lỗi xảy ra"
            end
      end
      




      private

      def comment_params
            params.require(:comment).permit(:description, :rating)
      end

end
