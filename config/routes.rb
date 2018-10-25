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

      resources :restaurants, expect: [:show, :index]   do 
            get 'products/new' => 'products#new'
            post 'products/new' => 'products#create'
      end


      

end
