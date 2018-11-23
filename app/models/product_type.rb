class ProductType < ApplicationRecord
      has_many :products
      has_many :restaurants, through: :products

      validates :name, presence: {message: "^Tên không được để trống"}, length: {maximum: 50}, uniqueness: { case_sensitive: false, message: "^Loại sản phẩm đã có" }
end
