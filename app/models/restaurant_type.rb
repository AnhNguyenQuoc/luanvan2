class RestaurantType < ApplicationRecord
      has_many :restaurants, dependent: :destroy

      validates :name, presence: {message: "^Tên không được để trống"}, length: {maximum: 50}, uniqueness: { case_sensitive: false, message: "^Loại cửa hàng đã tồn tại" }
end
