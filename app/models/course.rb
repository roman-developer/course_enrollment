class Course < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  
  has_many :enrollments
  has_many :teachers, through: :enrollments
end
