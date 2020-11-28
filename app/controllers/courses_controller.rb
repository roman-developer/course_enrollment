class CoursesController < ApplicationController
  before_action :get_teacher, only: [:create]

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)

    if @teacher.persisted?
      if @course.save
        enrolling_teacher_course( @course)
        redirect_to root_path, notice: 'The course was created successfully'
      end
    else
      render 'new'
    end
  end

  def vote
    @course = Course.where(id: params[:id]).first
    voter = Teacher.where(email: params[:email]).first
    check_voter = voter.voted_for? @course if (@course && voter).present?

    unless check_voter
      @course.liked_by voter 
      return render(json: {message: "like successfull" }, status: 200)
    end
    return render(json: {message: "like not successfull" }, status: 200)
  end

  private

  def course_params
    params.require(:course).permit(:title)
  end

  def get_teacher
    @teacher = Teacher.where(email: params[:email]).first_or_create if params[:email]
  end

  def enrolling_teacher_course(course)
    Enrollment.create(teacher: @teacher, course: course)
  end
end
