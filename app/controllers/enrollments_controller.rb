class EnrollmentsController < ApplicationController
  before_action :get_teacher, only: [:create]

  def index
    @enrollments = Enrollment.group(:course_id)
  end

  def new
    @enrollment = Enrollment.new
  end

  def create
    @enrollment = Enrollment.new(enrollment_params)
    if @teacher.persisted?
      enroll_teacher(params[:email])
      if @enrollment.save 
        redirect_to root_path, notice: 'You have been enrolled in the course successfully'
      else
        render 'new', alert: @enrollment.errors
      end
    else
      render 'new'
    end
  end

  private

  def enrollment_params
    params.require(:enrollment).permit(:course_id)
  end

  def enroll_teacher(email)
    @enrollment.teacher_id = @teacher.id
  end

  def get_teacher
    @teacher = Teacher.where(email: params[:email]).first_or_create if params[:email]
  end
end
