class Product < ApplicationRecord
      has_one_attached :image

      has_and_belongs_to_many :orders
      belongs_to :restaurant
      belongs_to :product_type
end
