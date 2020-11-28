require 'rails_helper'

RSpec.describe "Enrollments", type: :request do
  describe 'as a teacher' do
    let!(:course) { FactoryBot.create(:course) }
    let!(:teacher) { FactoryBot.create(:teacher) }
    let!(:teacher2) { FactoryBot.create(:teacher, email: 'teacher2@mail.com') }
    
    it 'can see a list of enrollments' do
      FactoryBot.create(:enrollment, course: course, teacher: teacher)
      FactoryBot.create(:enrollment, course: course, teacher: teacher2)
      get '/enrollments'
      expect(response).to have_http_status(200)
      expect(Enrollment.count). to eq(2)
    end
    it 'can enroll in a course created by another teacher' do
      expect {
        post '/enrollments', params: { enrollment: { course_id: course.id }, email: teacher.email }
      }.to change { Enrollment.count }.from(0).to(1)
      expect(Enrollment.first.teacher.email).to eq(teacher.email)
      expect(flash[:notice]).to eq('You have been enrolled in the course successfully')
    end
  end
end
