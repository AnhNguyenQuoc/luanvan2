class RestaurantType < ApplicationRecord
      has_many :restaurants, dependent: :destroy
end
