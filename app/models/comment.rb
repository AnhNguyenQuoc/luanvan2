class Comment < ApplicationRecord
      belongs_to :user
      belongs_to :restaurant

      has_many_attached :images, dependent: :destroy

      validate :correct_image_type


      private

      def correct_image_type
        images.each do |image|
            if !image.content_type.in?(%('image/jpeg image/png'))
                errors.add(:images, "Cần phải là đuôi hình PNG hoặc JPEG")
            end
        end
      end
end
