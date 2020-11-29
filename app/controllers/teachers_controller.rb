class TeachersController < ApplicationController
  include Votable

  before_action :get_teacher, only: [:vote]
  before_action :get_teacher_voted, only: [:vote, :new_vote]
  
  def new_vote ; end

  def vote
    voting(@teacher, @teacher_voted)   
  end

  private

  def get_teacher_voted
    @teacher_voted = Teacher.where(id: params[:id]).first if params[:id]
  end
end
