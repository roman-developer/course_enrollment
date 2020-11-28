class Teacher < ApplicationRecord
  validates :email, presence: true, uniqueness: true

  has_many :enrollments
  has_many :courses, through: :enrollments

  acts_as_votable
  acts_as_voter
end
