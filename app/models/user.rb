class User < ApplicationRecord
      attr_accessor :remember_token, :activation_token, :reset_token

      before_save  {self.email = email.downcase}
      before_create :create_activation_digest
      

      has_secure_password validations: false
      has_one :restaurant, dependent: :destroy

      has_many :restaurant_favorites, dependent: :destroy
      has_many :restaurants, through: :restaurant_favorites
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


      def self.digest(string)
            cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine::cost 

            BCrypt::Password.create(string, cost: cost)
      end 

      #Returns a random token
      def self.new_token
            SecureRandom.urlsafe_base64
      end


      def remember
            self.remember_token = User.new_token 
            update_attribute(:remember_digest, User.digest(remember_token))
      end

      def forget 
            update_attribute(:remember_digest, nil)
      end

      # Returns true if the given token matches the digest.
      def authenticated?(attribute, token)
            digest = send("#{attribute}_digest")
            return false if digest.nil?
            BCrypt::Password.new(digest).is_password?(token)
      end

      def activate
            update_attribute(:activated,    true)
            update_attribute(:activated_at, Time.zone.now)
      end

      def send_activation_email
            UserMailer.account_activation(self).deliver_now
      end

      def create_reset_digest
            self.reset_token = User.new_token 
            update_attribute(:reset_digest,  User.digest(reset_token))
            update_attribute(:reset_sent_at, Time.zone.now)
      end

      def send_password_reset_email
            UserMailer.password_reset(self).deliver_now
      end

      def password_reset_expired?
            reset_sent_at < 2.hours.ago 
      end

      #Login social
      def self.from_omniauth(auth_hash)
            if self.where(email: auth_hash['info']['email']).exists?
                  return_user = self.where(email: auth_hash['info']['email']).first 
                  return_user.provider = auth_hash['provider']
                  return_user.uid = auth_hash['uid']
            else 
                  return_user = self.create do |user|
                        user.provider = auth_hash['provider']
                        user.uid = auth_hash['uid']
                        user.email = auth_hash['info']['email']
                        user.role_id = 1
                        user.activated = true
                  end 
            end

            return_user 
      end

      private
      def should_validate?
            new_record? || password.present?
      end


      def create_activation_digest
            self.activation_token = User.new_token 
            self.activation_digest = User.digest(activation_token)
      end
end
