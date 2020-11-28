require 'rails_helper'

RSpec.describe "Courses", type: :request do
  describe 'as a teacher' do
    let!(:teacher) { FactoryBot.create(:teacher) }
    it 'can create/enroll a new course' do
      expect {
        post '/courses', params: { course: { title: 'My first course' }, email: teacher.email }
      }.to change { Course.count }.from(0).to(1)
      expect(Teacher.count).to eq(1)
      expect(Enrollment.count).to eq(1)
      expect(flash[:notice]).to eq('The course was created successfully')
    end
    it 'can vote a course once' do
      
    end
  end
end
