class Coupon < ApplicationRecord

    validates :code, presence: true, uniqueness: true

    def is_valid?
        (self.expiration.nil? || self.expiration >= Date.current)
    end
end
