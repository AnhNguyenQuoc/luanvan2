class Restaurant < ApplicationRecord
      paginates_per 6

      before_save  {self.name = email.name}
      has_one_attached :image, dependent: :destroy
      has_many :products, dependent: :destroy
      has_many :comments, dependent: :destroy

      has_many :restaurant_favorites, dependent: :destroy
      has_many :users, through: :restaurant_favorites
      belongs_to :restaurant_type

      belongs_to :district
      belongs_to :user

      scope :find_district, ->(id) { where("district_id = ?", "#{id}")}
      scope :starts_with, -> (name) { where("name like ?", "#{name}%")}
      scope :find_type, -> (id){where("restaurant_type_id = ?", "#{id}")}
      scope :order_rating, -> { joins(:comments).group("restaurants.id").order("avg(comments.rating) DESC")}
      scope :order_name, -> {order("name ASC")}
      scope :order_uncheck, -> {where("order_type.id == 1")}
      # Ex:- scope :active, -> {where(:active => true)}

      validate :correct_image_type
      validates :name, presence: {message: "^Tên không được để trống"}, length: {maximum: 50}, uniqueness: { case_sensitive: false }
      validates :phone, presence: {message: "^SĐT được để trống"}
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
                  errors.add(:image, 'Cần phải là JPEG hoặc PNG')
            elsif image.attached? == false 
                  errors.add(:image, 'Cần phải có ảnh')
            end 
      end
end
