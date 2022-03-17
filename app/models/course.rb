class Course < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_one_attached :banner
  has_many :topics
end
