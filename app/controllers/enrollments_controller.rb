class EnrollmentsController < ApplicationController

  def index
    @enrollments = Enrollment.all
  end

  def new
    @enrollment = Enrollment.new
  end

  def create
    @enrollment = Enrollment.new(enrollment_params)
    enroll_teacher(params[:email]) if params[:email].present?

    if @enrollment.save && @teacher.present?
      redirect_to root_path, notice: 'You have been enrolled in the course successfully'
    else
      render 'new'
    end
  end

  private

  def enrollment_params
    params.require(:enrollment).permit(:course_id)
  end

  def enroll_teacher(email)
    @teacher = Teacher.where(email: email).first_or_create
    @enrollment.teacher_id = @teacher.id
  end

end
