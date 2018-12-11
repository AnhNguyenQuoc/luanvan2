module ApplicationHelper
      
      def number_to_currency_vnd(price)
            number_to_currency(price, precision: 0, format: "%n%u", unit: "đ")
      end
      
      def number_to_phone_vn(phone)
            number_to_phone(phone, country_code: 84, delimiter: " ")
      end

      def custom_flash
            flash.each do |type, message| 
                  text = "<script>Materialize.toast(#{message}, 4000)</script>"
                  text.html_safe
            end 
      end

end
