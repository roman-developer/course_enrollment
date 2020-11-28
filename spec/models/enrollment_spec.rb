require 'rails_helper'

RSpec.describe Enrollment, type: :model do
  let!(:course) { FactoryBot.create(:course) }
  let!(:teacher) { FactoryBot.create(:teacher) }
  
  it "is valid with valid attributes" do
    enrollment = FactoryBot.build(:enrollment, course: course, teacher: teacher)
    expect(enrollment).to be_valid
  end
  it "is not valid without a course" do
    enrollment = FactoryBot.build(:enrollment, course: nil, teacher: teacher)
    expect(enrollment).to_not be_valid
  end
  it "is not valid without a teacher" do
    enrollment = FactoryBot.build(:enrollment, course: course, teacher: nil)
    expect(enrollment).to_not be_valid
  end
end
