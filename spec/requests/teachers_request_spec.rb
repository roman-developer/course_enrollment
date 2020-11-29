require 'rails_helper'

RSpec.describe "Teachers", type: :request do
  describe 'as a teacher' do
    let!(:teacher) { FactoryBot.create(:teacher) } # teacher who is voted
    let!(:voter) { FactoryBot.create(:teacher, email: "voter@mail.com") } # teacher who is voting
    it 'can vote a teacher once' do
      expect {
        post "/teachers/#{teacher.id}/vote", params: { email: voter.email }
      }.to change { teacher.get_likes.size }.from(0).to(1)
      expect(flash[:notice]).to eq('vote successfull')
      # if the teacher try to repeat voting the same again, it is not valid
      post "/teachers/#{teacher.id}/vote", params: { email: voter.email }
      expect(teacher.get_likes.size).to eq(1)
    end
  end
end
