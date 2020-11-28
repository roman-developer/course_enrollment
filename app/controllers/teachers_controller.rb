class TeachersController < ApplicationController

  def vote
    @teacher = Teacher.where(id: params[:id]).first
    voter = Teacher.where(email: params[:email]).first
    check_voter = voter.voted_for? @teacher if (@teacher && voter).present?

    unless check_voter
      @teacher.liked_by voter 
      return render(json: {message: "like successfull" }, status: 200)
    end
    return render(json: {message: "like not successfull" }, status: 200)
  end

end
