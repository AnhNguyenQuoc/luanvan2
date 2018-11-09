class User < ApplicationRecord

      before_save  {self.email = email.downcase}

      has_secure_password
      has_one :restaurant, dependent: :destroy
      has_many :buyer_order, class_name: "Order",
                                          foreign_key: "buyer_id",
                                          dependent: :destroy 
      has_many :shipper_order, class_name: "Order",
                                          foreign_key: "shipper_id",
                                          dependent: :destroy 

      has_many :buyer, through: :buyer_order, source: :buyer
      has_many :shipper, through: :shipper_order, source: :shipper
      
      belongs_to :role
      belongs_to :district

      validates :username, presence: {message: "^Họ và tên không được để trống"}, length: {maximum: 50}
      VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
      validates :email, presence: {message: "^Email không được để trống"}, uniqueness: { case_sensitive: false },
                                                      length: {maximum: 255},
                                                      format: { with: VALID_EMAIL_REGEX }
      validates :phone, presence: true
      validates :address, presence: true, length: {maximum: 50}
      validates :password, presence: true, length: {minimum: 6}, allow_nil: true, on: :create
end
