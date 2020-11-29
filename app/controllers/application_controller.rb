class ApplicationController < ActionController::Base

  private

  def get_teacher
    @teacher = Teacher.where(email: params[:email]).first_or_create if params[:email]
  end

end
