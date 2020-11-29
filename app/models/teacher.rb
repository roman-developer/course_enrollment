class Teacher < ApplicationRecord
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP } 

  has_many :enrollments
  has_many :courses, through: :enrollments

  acts_as_votable
  acts_as_voter

  scope :ordered_by_vote, -> { order(cached_votes_total: :desc) }
  scope :more_voted, -> { ordered_by_vote.limit(3) }
  scope :count_voted, -> { ordered_by_vote.count }
end
