class CoursesController < ApplicationController
  include Votable

  before_action :get_teacher, only: [:create, :vote]
  before_action :get_course, only: [:new_vote, :vote, :show]

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    if @teacher.persisted?
      if @course.save
        enrolling_teacher_course( @course)
        redirect_to root_path, notice: 'The course was created successfully'
      else
        render 'new', alert: @course.errors
      end
    else
      render 'new'
    end
  end

  def new_vote ; end

  def vote
    voting(@teacher, @course)   
  end

  def show ; end

  private

  def course_params
    params.require(:course).permit(:title)
  end

  def get_teacher
    @teacher = Teacher.where(email: params[:email]).first_or_create if params[:email]
  end

  def get_course
    @course = Course.where(id: params[:id]).first if params[:id]
  end

  def enrolling_teacher_course(course)
    Enrollment.create(teacher: @teacher, course: course)
  end
end
