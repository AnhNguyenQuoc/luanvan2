Rails.application.routes.draw do

      root "templates#index"
      get '/restaurantinfo' => 'templates#inforestaurant'
      get '/shipper' => 'templates#shipper'


      get '/signup' => 'users#new'
      post '/signup' => 'users#create'
      resources :users, only: [:edit, :update]

      get 'users/:id/orders' => 'users#orders_user', as: "order_user"

      get '/login', to: 'sessions#new'
      post '/login',  to: 'sessions#create'
      delete '/logout', to: 'sessions#destroy'
      
      post 'orders' => 'orders#create'
      post 'line_items/:id/add' => "line_items#add_quantity", as: "line_item_add"
      post 'line_items/:id/reduce' => "line_items#reduce_quantity", as: "line_item_reduce"
      delete 'line_items/:id' => 'line_items#destroy', as: "line_item_destroy"
      post 'line_items' => "line_items#create"
      
      post 'comments' => 'comments#create'

      get '/cua-hang' => 'restaurants#index', as: "cua_hang"
      get '/cua-hang/:id/nhan-xet' => 'restaurants#show_comment', as: "restaurant_comment"
      get '/cua-hang/:id/dat-mon' => 'restaurants#show', as: "restaurant_dat_mon"

      get '/admin-res' => 'admin_restaurants#index'
      get '/admin-res/sua-thong-tin' => 'restaurants#edit'
      get '/admin-res/thong-ke-doanh-thu' => 'admin_restaurants#statistic_total'
      get '/admin-res/danh-sach-don-hang' => 'admin_restaurants#list_order'
      get '/admin-res/danh-sach-mon-an' => 'admin_restaurants#list_product'


      get '/admin' => 'admins#index'
      get '/admin/thong-ke-doanh-thu' => 'admins#statistic_total'
      get '/admin/danh-sach-cua-hang' => 'admins#list_restaurants'
      
      delete 'restaurants/:id' => 'restaurants#destroy', as: "restaurant_destroy"

      get '/admin-res/danh-sach-mon-an/them-san-pham' => 'products#new'
      get '/admin-res/danh-sach-mon-an/:id/sua-san-pham/' => 'products#edit', as: "products_sua"
      delete 'products/:id' => 'products#destroy', as: "product_destroy"

      patch 'products/:id/edit' => 'products#update', as: 'product_edit'
      post 'products/new' => 'products#create'

      post '/orders/:id/change_status' => 'orders#change_status', as: "orders_change_status"
      delete '/orders/:id' => 'orders#destroy', as: "order_destroy"

end
