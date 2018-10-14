class ApplicationController < ActionController::Base
      include SessionsHelper




       private
            def current_cart
                  unless @current_cart
                        if session[:cart_id]
                              @current_cart = Cart.where(:id => session[:cart_id]).first || Cart.create
                              session[:cart_id] = @current_cart.id
                        end
                  end
                  return @current_cart
            end
end
