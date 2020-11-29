require 'rails_helper'

RSpec.describe Teacher, type: :model do
  it "is valid with valid attributes" do
    teacher = FactoryBot.build(:teacher)
    expect(teacher).to be_valid
  end
  it "is not valid without an email" do
    teacher = FactoryBot.build(:teacher, email: nil)
    expect(teacher).to_not be_valid
  end
  it "is not valid with a wrong email address" do
    teacher = FactoryBot.build(:teacher, email: '@hola!')
    expect(teacher).to_not be_valid
  end
  it "is not valid with a repeated email" do
    teacher1 = FactoryBot.create(:teacher, email: 'teacher@mail.com')
    teacher2 = FactoryBot.build(:teacher, email: 'teacher@mail.com')
    expect(teacher2).to_not be_valid
  end
end
