class Teacher < ApplicationRecord
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP } 

  has_many :enrollments
  has_many :courses, through: :enrollments

  acts_as_votable
  acts_as_voter
end
