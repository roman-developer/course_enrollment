class CoursesController < ApplicationController

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)

    if @course.save && params[:email].present?
      enrolling_teacher_course(params[:email], @course)
      redirect_to root_path, notice: 'The course was created successfully'
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

  def enrolling_teacher_course(email, course)
    teacher = Teacher.where(email: email).first_or_create if email.present?
    Enrollment.create(teacher: teacher, course: course)
  end
end
