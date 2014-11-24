require 'rails_helper'

describe "User" do

  before(:each) do
    @user = User.create!(
      email: Faker::Internet.email,
      name: Faker::Name.name,
      password: "password",
      password_confirmation: "password"
    )
  end

  it "is valid with a email" do
    expect(@user).to be_valid
  end

  it "is invalid with a duplicate email address" do
    user_duplicate = User.new(
      email: @user.email,
      name: Faker::Name.name,
      password: "password",
      password_confirmation: "password"
    )
    user_duplicate.valid?
    expect(user_duplicate.errors[:email]).to include("has already been taken")
  end

end
