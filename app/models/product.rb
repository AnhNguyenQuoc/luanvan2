class Product < ApplicationRecord

      before_destroy :ensure_not_referenced_by_any_line_item

      has_one_attached :image
      has_many :line_items
      has_many :orders, through: :line_items

      belongs_to :restaurant
      belongs_to :product_type

      scope :search, ->(name){ where("name LIKE ?", "#{name}%") }
      
      #  delegate :uncheck, to: :orders, prefix: true

      private
      def ensure_not_referenced_by_any_line_item
            unless line_items.empty?
                  errors.add(:base, 'Vẫn tồn tại đơn hàng có sản phẩm này')
                  throw :abort
            end
      end
end
