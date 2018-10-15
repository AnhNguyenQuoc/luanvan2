Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
      root to: 'templates#index'
      get '/restaurantinfo' => 'templates#inforestaurant'
      get '/shipper' => 'templates#shipper'


      get '/signup' => 'users#new'
      post '/signup' => 'users#create'

      get '/login', to: 'sessions#new'
      post '/login',  to: 'sessions#create'
      delete '/logout', to: 'sessions#destroy'

      post 'line_items/:id/add' => "line_items#add_quantity", as: "line_item_add"
      post 'line_items/:id/reduce' => "line_items#reduce_quantity", as: "line_item_reduce"
      delete 'line_items/:id' => 'line_items#destroy', as: "line_item_destroy"
      post 'line_items' => "line_items#create"
      resources :restaurants do 
            resources :products
      end
end
