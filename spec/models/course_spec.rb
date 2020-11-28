require 'rails_helper'

RSpec.describe Course, type: :model do
  it "is valid with valid attributes" do
    course = FactoryBot.build(:course)
    expect(course).to be_valid
  end
  it "is not valid without an email" do
    course = FactoryBot.build(:course, title: nil)
    expect(course).to_not be_valid
  end
  it "is not valid with a repeated email" do
    course1 = FactoryBot.create(:course, title: 'Basic HTML')
    course2 = FactoryBot.build(:course, title: 'Basic HTML')
    expect(course2).to_not be_valid
  end
end
