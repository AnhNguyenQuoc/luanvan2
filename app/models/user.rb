class User < ApplicationRecord

      before_save  {self.email = email.downcase}

      has_secure_password validations: false
      has_one :restaurant, dependent: :destroy
      has_many :buyer_order, class_name: "Order",
                                          foreign_key: "buyer_id"
      has_many :shipper_order, class_name: "Order",
                                          foreign_key: "shipper_id"

      has_many :buyer, through: :buyer_order, source: :buyer
      has_many :shipper, through: :shipper_order, source: :shipper

      has_many :comments
      
      belongs_to :role
      belongs_to :district, optional: true      

      validates :username, presence: {message: "^Họ và tên không được để trống"}, length: {maximum: 50}
      VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
      validates :email, presence: {message: "^Email không được để trống"}, uniqueness: { case_sensitive: false, message: "^Email đã đăng ký " },
                                                      length: {maximum: 255},
                                                      format: { with: VALID_EMAIL_REGEX, message: "^Email không đúng định dạng" }
      validates :phone, presence: {message: "^Sđt không được để trống"}
      validates :address, presence: {message: "^Địa chỉ không được để trống"}, length: {maximum: 50}
      validates :password, length: {minimum: 6, message: "^Mật khẩu phải nhiều hơn 6 kí tự"}, allow_nil: true, confirmation: {message: "^Mật khẩu không trùng khớp"}, if: :should_validate?
      validates :district_id, presence: {message: "^Phải chọn quận"}



      def self.from_omniauth(auth_hash)
            user = find_or_create_by(uid: auth_hash['uid'], provider: auth_hash['provider'])
            user.email = auth_hash['info']['email']
            user.role_id = 1

            user.save(:validate => false)
            user 
      end

      private
      def should_validate?
            new_record? || password.present?
      end
end
