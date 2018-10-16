class Comment < ApplicationRecord
      belongs_to :user
      belongs_to :restaurant

      has_many_attached :images, dependent: :destroy
end
