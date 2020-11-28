class Enrollment < ApplicationRecord
  belongs_to :course
  belongs_to :teacher
  validates :teacher, uniqueness: { scope: :course } # it means that only one teacher can enroll in the same course
end
