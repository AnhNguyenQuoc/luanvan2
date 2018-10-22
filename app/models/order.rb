class Order < ApplicationRecord

      has_many :line_items, dependent: :destroy
      has_many :products, through: :line_items
      
      belongs_to :order_type
      belongs_to :buyer, class_name: "User"
      belongs_to :shipper, class_name: "User", optional: true
      
      scope :uncheck, -> {where("order_type_id = 1")}
      scope :check, -> {where("order_type_id = 2")}


      def add_line_item_from_cart(cart)
        cart.line_items.each do |item|
            product = Product.find_by(id: item.product)
            item.cart_id = nil
            line_items << item
        end
      end
end
