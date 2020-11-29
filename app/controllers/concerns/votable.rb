module Votable
  extend ActiveSupport::Concern

  def voting(voter, votable)
    if (votable && voter).persisted?
      # check_voter = check if a voter (@teacher) has voted on a teacher (teacher_voted)
      check_voter = voter.voted_for? votable 
      unless check_voter
        votable.liked_by voter
        redirect_to root_path, notice: "vote successfull"
      else
        render 'new_vote', alert: votable.errors.add(:vote, "not successfull! This teacher has already voted")
      end
    else
      render 'new_vote'
    end 
  end
end