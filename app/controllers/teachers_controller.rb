class TeachersController < ApplicationController
  before_action :get_teacher, only: [:vote]
  before_action :get_teacher_voted, only: [:vote, :new_vote]
  
  def new_vote ; end

  def vote
    @teacher_voted = Teacher.where(id: params[:id]).first
    if (@teacher_voted && @teacher).persisted?
      # check_voter = check if a voter (@teacher) has voted on a teacher (teacher_voted)
      check_voter = @teacher.voted_for? @teacher_voted 
      unless check_voter
        @teacher_voted.liked_by @teacher
        redirect_to root_path, notice: "vote successfull"
      else
        render 'new_vote', alert: @teacher_voted.errors.add(:vote, "not successfull! This teacher has already voted")
      end
    else
      render 'new_vote'
    end    
  end

  private

  def get_teacher
    @teacher = Teacher.where(email: params[:email]).first_or_create if params[:email]
  end

  def get_teacher_voted
    @teacher_voted = Teacher.where(id: params[:id]).first if params[:id]
  end
end
