class Restaurant < ApplicationRecord
      has_one_attached :image, dependent: :destroy
      has_many :products, dependent: :destroy
      has_many :comments, dependent: :destroy

      belongs_to :restaurant_type

      belongs_to :district
      belongs_to :user

      scope :find_district, ->(id) { where("district_id = ?", "#{id}")}
      scope :starts_with, -> (name) { where("name like ?", "#{name}%")}
      scope :order_rating, -> { joins(:comments).group("restaurants.id").order("avg(comments.rating) DESC")}
      scope :order_name, -> {order("name ASC")}
      # Ex:- scope :active, -> {where(:active => true)}


      def avg_rating
            comments.average(:rating).to_i
      end
end
