require 'rails_helper'

RSpec.describe "Courses", type: :request do
  describe 'as a teacher' do
    let!(:teacher) { FactoryBot.create(:teacher) }
    let!(:voter) { FactoryBot.create(:teacher, email: "voter@mail.com") } # teacher who is voting
    it 'can create/enroll a new course' do
      expect {
        post '/courses', params: { course: { title: 'My first course' }, email: teacher.email }
      }.to change { Course.count }.from(0).to(1)
      expect(Enrollment.count).to eq(1)
      expect(flash[:notice]).to eq('The course was created successfully')
    end
    it 'can vote a course once' do
      course = FactoryBot.create(:course) # teacher who is voted
      expect {
        post "/courses/#{course.id}/vote", params: { email: voter.email }
      }.to change { course.get_likes.size }.from(0).to(1)
      expect(JSON.parse(response.body).with_indifferent_access[:message]).to eq('like successfull')
      # if the teacher try to repeat voting the same again, it is not valid
      post "/courses/#{course.id}/vote", params: { email: voter.email }
      expect(JSON.parse(response.body).with_indifferent_access[:message]).to eq('like not successfull')
    end
  end
end
