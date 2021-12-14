require 'rails_helper'

RSpec.describe User, type: :request do
  it 'returns all users'do
  get '/users'
  expect(response).to have_http_status(:success)
  end
  it 'should register the user'do
  params = User.new(
    email:"hasanbatis44@gmail.com",
    userType: 1,
    name: "hasan",
    password:"2321223"
  )
  expect(params).to be_valid
  end


  it 'should not register the user'do
  params = User.new(
    email:"hasanbatis44",
    userType: 1,
    name: "hasan",
    password:"2321223"
  )
  expect(params).not_to be_valid
  end

    it "signs user in" do
      user = User.create(email: 'test@test.com', password: "password", password_confirmation: "password")
      sign_in user
        expect(user).to be_valid
    end

    it "signs user out" do
       user = User.create(email: 'test@test.com', password: "password", password_confirmation: "password")
      sign_out user
      expect(user).to be_valid
    end

end
