class Cart < ApplicationRecord
      has_many :line_items, dependent: :destroy

      def total_price
            line_items.to_a.sum {|item| item.total_price}
      end

      def total_all_price
            total_price + total_ship
      end

      def total_ship
            count = line_items.to_a.sum{ |item| item.quantity}
            if(count <= 2 && count > 0)
                  return 20000
            elsif (count > 2 && count <= 4)
                  return 15000
            elsif(count > 4 && count <= 6)
                  return 10000
            elsif(count == 0)
                  return 0
            else 
                  return 0
            end
      end
end
