class Product < ApplicationRecord

      before_destroy :ensure_not_referenced_by_any_line_item

      has_one_attached :image

      has_and_belongs_to_many :orders
      belongs_to :restaurant
      belongs_to :product_type


      private
      def ensure_not_referenced_by_any_line_item
            unless line_items.empty?
                  errors.add(:base, 'Line items present')
                  throw :abort
            end
      end
end
