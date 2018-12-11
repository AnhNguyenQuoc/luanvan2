class Restaurant < ApplicationRecord
      paginates_per 6

      before_save  {self.name = self.name}
      has_one_attached :image, dependent: :destroy
      has_many :products, dependent: :destroy
      has_many :comments, dependent: :destroy
      has_many :product_types, through: :products

      has_many :restaurant_favorites, dependent: :destroy
      has_many :users, through: :restaurant_favorites
      belongs_to :restaurant_type

      belongs_to :district
      belongs_to :user

      scope :find_district, ->(id) { where("district_id = ?", "#{id}")}
      scope :starts_with, -> (name) { where("name like ?", "%#{name}%")}
      scope :find_type, -> (id){where("restaurant_type_id = ?", "#{id}")}
      scope :order_rating, -> { joins(:comments).group("restaurants.id").order("avg(comments.rating) DESC")}
      scope :order_name, -> {order("name ASC")}
      scope :order_name_reverse, -> {order("name DESC")}
      scope :order_uncheck, -> {where("order_type.id == 1")}
      scope :find_product_type, -> (id){joins(:product_types).where("product_types.id = ?", "#{id}")}
      # Ex:- scope :active, -> {where(:active => true)}

      VALID_PHONE_REGEX = /\A(09|07|03|08|05)+([0-9]{8})\b\z/i

      validate :correct_image_type
      validates :name, presence: {message: "^Tên không được để trống"}, length: {maximum: 50}
      validates :phone, presence: {message: "^Sđt không được để trống"}, format: {with: VALID_PHONE_REGEX, message: "^Số điện thoại không đúng định dạng"}
      validates :address, presence: {message: "^Địa chỉ được để trống"}, length: {maximum: 50}
      validates :timeopen, presence: {message: "^Thời gian mở cửa được để trống"}
      validates :timeclose, presence: {message: "^Thời gian đóng cửa được để trống"}
      validates :restaurant_type_id, presence: {message: "^Cần có loại cửa hàng"}

      
      def avg_rating
            comments.average(:rating).to_i
      end

      private
      def correct_image_type
            if image.attached? && !image.content_type.in?(%w(image/jpeg image/png))
                  errors.add(:image, '^Cần phải là JPEG hoặc PNG')
            elsif image.attached? == false 
                  errors.add(:image, '^Cần phải có ảnh')
            end 
      end
end
