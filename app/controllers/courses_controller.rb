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

  private

  def course_params
    params.require(:course).permit(:title)
  end

  def enrolling_teacher_course(email, course)
    teacher = Teacher.where(email: email).first_or_create if email.present?
    Enrollment.create(teacher: teacher, course: course)
  end
end
