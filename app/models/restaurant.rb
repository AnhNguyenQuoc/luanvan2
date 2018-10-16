class Restaurant < ApplicationRecord
      has_one_attached :image, dependent: :destroy
      has_many :products, dependent: :destroy
      has_many :comments, dependent: :destroy

      belongs_to :restaurant_type

      belongs_to :district
      belongs_to :user
end
