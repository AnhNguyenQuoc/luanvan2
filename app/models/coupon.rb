class Coupon < ApplicationRecord

    validates :code, presence: {message: "^Mã khuyến mãi không được để trống"}, uniqueness: {message: "^Mã khuyến mãi đã tồn tại"}
    validates :amount, presence: {message: "^Phần trăm khuyến mãi không được để trống"}, numericality: {greater_than_or_equal_to: 0, message: "^Phần trăm phải lớn hơn 0" } 
    validates :expiration, presence: {message: "^Phải có ngày hết hạn"}
    def is_valid?
        (self.expiration.nil? || self.expiration >= Date.current)
    end
end
