require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  subject { User.new(email: "jsmith@sample.com", password: "password") }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end
  it "is not valid without an email" do
    subject.email = nil
    expect(subject).to_not be_valid
  end
  it "is not valid if email is not unique" do
    User.create(email: "jsmith@sample.com", password: "123456" )
    expect(subject).to_not be_valid
  end

end