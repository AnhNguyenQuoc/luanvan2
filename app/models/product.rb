class Product < ApplicationRecord
      paginates_per 10
      before_destroy :ensure_not_referenced_by_any_line_item

      has_one_attached :image
      has_many :line_items
      has_many :orders, through: :line_items

      belongs_to :restaurant
      belongs_to :product_type, optional: true

      scope :search, ->(name){ where("name LIKE ?", "#{name}%") }
      
      #  delegate :uncheck, to: :orders, prefix: true
      validates :name, presence: {message: "^Tên không được để trống"}
      validates :price  , presence: {message: "^Giá sp không được để trống"}, numericality: {greater_than_or_equal_to: 0, message: "^Giá sản phẩm phải lớn hơn 0" } 
      validates :product_type ,presence: {message: "^Loại sản phẩm không được để trống"}
      validate :image?

      private
      def ensure_not_referenced_by_any_line_item
            unless line_items.empty?
                  errors.add(:base, 'Vẫn tồn tại đơn hàng có sản phẩm này')
                  throw :abort
            end
      end

      def image?
            if image.attached? && !image.content_type.in?(%w(image/jpeg image/png))
                  errors.add(:image, '^Cần phải là JPEG hoặc PNG')
            elsif image.attached? == false 
                  errors.add(:image, '^Cần phải có ảnh')
            end 
      end
end
