module ApplicationHelper


      def number_to_currency_vnd(price)
            number_to_currency(price, precision: 0, format: "%n%u", unit: "đ")
      end

end
