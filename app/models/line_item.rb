class LineItem < ApplicationRecord
      belongs_to :product
      belongs_to :cart 
      belongs_to :order

      def total_price 
            product.price.to_i * quantity
      end
end
