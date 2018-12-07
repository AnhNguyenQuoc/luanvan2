Rails.application.routes.draw do


      root "templates#index"
      get '/restaurantinfo' => 'templates#inforestaurant'
      get '/shipper' => 'templates#shipper'


      get '/signup' => 'users#new'
      post '/signup' => 'users#create'
      resources :users, only: [:edit, :update]
      resources :account_activations, only: [:edit]
      resources :password_resets,     only: [:new, :create, :edit, :update]

      get 'users/:id/orders' => 'users#orders_user', as: "order_user"
      get 'users/:id/restaurants' => 'users#list_restaurant_favorite', as: "restaurant_favorite_user"
      get 'users/:id/comments' => 'users#list_comment', as: "comments_user"
      get '/login', to: 'sessions#new'
      post '/login',  to: 'sessions#create'
      delete '/logout', to: 'sessions#destroy'
      #Login social
      get '/auth/:provider/callback', :to => 'sessions#create'
      get '/auth/failure', :to => 'sessions#failure'
      
      post 'orders' => 'orders#create'
      post 'line_items/:id/add' => "line_items#add_quantity", as: "line_item_add"
      post 'line_items/:id/reduce' => "line_items#reduce_quantity", as: "line_item_reduce"
      delete 'line_items/:id' => 'line_items#destroy', as: "line_item_destroy"
      post 'line_items' => "line_items#create"
      
      post 'comments' => 'comments#create'

      get '/cua-hang' => 'restaurants#index', as: "cua_hang"
      get '/cua-hang/:id/nhan-xet' => 'restaurants#show_comment', as: "restaurant_comment"
      get '/cua-hang/:id/dat-mon' => 'restaurants#show_order', as: "restaurant_dat_mon"
      get '/cua-hang/:id' => 'restaurants#show', as: "restaurant_trang_chu"

      get '/admin-res' => 'admin_restaurants#index'
      get '/admin-res/:id/sua-thong-tin/' => 'restaurants#edit',as: "admin_res_edit"
      patch '/admin-res/:id/sua-thong-tin' => 'restaurants#update', as: "res_edit"
      get '/admin-res/thong-ke-doanh-thu' => 'admin_restaurants#statistic_total'
      get '/admin-res/danh-sach-don-hang' => 'admin_restaurants#list_order'
      get '/admin-res/danh-sach-mon-an' => 'admin_restaurants#list_product'

      get '/admin-res/danh-sach-mon-an/them-san-pham' => 'products#new'
      post '/admin-res/danh-sach-mon-an/them-san-pham' => 'products#create'
      get '/admin-res/danh-sach-mon-an/:id/sua-san-pham/' => 'products#edit', as: "products_sua"

      get '/admin-res/thong-ke-don-hang-ngay' => 'admin_restaurants#statistic_orders_by_day'
      get '/admin-res/thong-ke-don-hang-thang' => 'admin_restaurants#statistic_orders_by_month'
      get '/admin-res/thong-ke-don-hang-nam' => 'admin_restaurants#statistic_orders_by_year'

      get '/admin' => 'admins#index'
      get '/admin/thong-ke-doanh-thu' => 'admins#statistic_total'
      get '/admin/danh-sach-cua-hang' => 'admins#list_restaurants'
      get '/admin/danh-sach-nguoi-dung' => 'admins#list_user'
      get '/admin/danh-sach-nguoi-dung/tao-moi' => 'admins#user_create'
      get '/admin/danh-sach-don-hang' => 'admins#list_order'
      get '/admin/danh-sach-don-hang/:id' => 'admins#update_shipper', as: "shipper_edit"
      patch 'admin/danh-sach-don-hang/:id' => 'orders#update_shipper', as: "update_shipper"

      post '/admin/danh-sach-nguoi-dung/tao-moi' => 'users#admin_create'
      delete 'admin/danh-sach-nguoi-dung/:id' => 'users#destroy', as: "admin_user_destroy"

      get '/admin/loai-thuc-an' => 'product_types#index'
      get '/admin/loai-thuc-an/tao-moi' => 'product_types#new'
      post '/admin/loai-thuc-an/tao-moi' => 'product_types#create'

      get '/admin/loai-thuc-an/:id/sua' => 'product_types#edit', as: "product_type_edit"
      patch '/admin/loai-thuc-an/:id/sua' => 'product_types#update'

      delete '/admin/loai-thuc-an/:id' => 'product_types#destroy', as: 'product_types_destroy'

      get '/admin/loai-cua-hang' => 'restaurant_types#index'

      get '/admin/loai-cua-hang/tao-moi' => 'restaurant_types#new'
      post '/admin/loai-cua-hang/tao-moi' => 'restaurant_types#create'

      get '/admin/loai-cua-hang/:id/sua' => 'restaurant_types#edit', as: "restaurant_type_edit"
      patch '/admin/loai-cua-hang/:id/sua' => 'restaurant_types#update'

      delete '/admin/loai-cua-hang/:id' => 'restaurant_types#destroy', as: 'restaurant_type_destroy'
      
      get '/admin/danh-sach-nhan-xet' => 'admins#list_comments'

      get '/admin/thong-ke-don-hang-ngay' => 'admins#statistic_orders_by_day'
      get '/admin/thong-ke-don-hang-thang' => 'admins#statistic_orders_by_month'
      get '/admin/thong-ke-don-hang-nam' => 'admins#statistic_orders_by_year'

      get '/admin-shipper' => 'admin_shippers#index'
      post '/orders/:id/update_complete' => 'orders#update_complete', as: "order_update_complete"
      
      get '/admin-shipper/danh-sach-don-hang' => 'admin_shippers#list_order'
      
      get '/tao-cua-hang' => 'restaurants#new'
      post '/tao-cua-hang' => 'restaurants#create', as: 'restaurant_create'

      delete 'restaurants/:id' => 'restaurants#destroy', as: "restaurant_destroy"
      
      
      delete 'products/:id' => 'products#destroy', as: "product_destroy"

      patch 'products/:id/edit' => 'products#update', as: 'product_edit'
      

      post '/orders/:id/change_status' => 'orders#change_status', as: "orders_change_status"
      post '/orders/:id/change_status_destroy' => 'orders#change_status_destroy', as: "order_change_status_destroy"
      delete '/orders/:id' => 'orders#destroy', as: "order_destroy"

      delete '/comments/:id' => 'comments#destroy', as: "comment_destroy"
      delete '/comments_admin/:id' => 'comments#destroy_admin', as: "comment_admin_destroy"
      #Coupons
      get '/admin/coupons' => 'coupons#index'
      get '/admin/coupons/tao-moi' => 'coupons#new'
      post '/admin/coupons/tao-moi' => 'coupons#create'
      delete '/admin/coupons/:id' => 'coupons#destroy', as: "coupon_destroy"

      #Res Favorite
      resources :restaurant_favorites, only: [:create]
      delete '/restaurant-favorite/' => 'restaurant_favorites#destroy', as: "res_favorite_destroy"


end
