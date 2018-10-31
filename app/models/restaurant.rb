class Restaurant < ApplicationRecord
      paginates_per 6

      has_one_attached :image, dependent: :destroy
      has_many :products, dependent: :destroy
      has_many :comments, dependent: :destroy

      belongs_to :restaurant_type

      belongs_to :district
      belongs_to :user

      scope :find_district, ->(id) { where("district_id = ?", "#{id}")}
      scope :starts_with, -> (name) { where("name like ?", "#{name}%")}
      scope :find_type, -> (id){where("order_type_id = ?", "#{id}")}
      scope :order_rating, -> { joins(:comments).group("restaurants.id").order("avg(comments.rating) DESC")}
      scope :order_name, -> {order("name ASC")}
      scope :order_uncheck, -> {where("order_type.id == 1")}
      # Ex:- scope :active, -> {where(:active => true)}

      validate :correct_image_type


      
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
