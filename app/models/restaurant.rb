class Restaurant < ApplicationRecord
      has_one_attached :image
      has_many :products
      belongs_to :district
      belongs_to :user
end
