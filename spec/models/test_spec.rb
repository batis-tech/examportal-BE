require 'rails_helper'

RSpec.describe Test, type: :request do
  it 'returns all tests' do
  get '/tests'
  expect(response).to have_http_status(:success)
  end

  it 'should create an exam'do
  params = Test.new(
     {"title"=>"test", "description"=>"new", "questions_attributes"=>[{"questionTitle"=>"new", "questionDetail"=>"new"}], "options_attributes"=>[{"optionTitle"=>"new", "optionCorrect"=>"1"}]}
  )
  expect(params).to be_valid
  end

  it 'should update an exam' do
  @params = Test.new(
     {"title"=>"test", "description"=>"new", "questions_attributes"=>[{"questionTitle"=>"new", "questionDetail"=>"new"}], "options_attributes"=>[{"optionTitle"=>"new", "optionCorrect"=>"1"}]}
  )
  params = @params.update(
     {"title"=>"test2", "description"=>"new", "questions_attributes"=>[{"questionTitle"=>"new", "questionDetail"=>"new"}], "options_attributes"=>[{"optionTitle"=>"new", "optionCorrect"=>"1"}]}
  )
  expect(params).to be true
  end


  it 'should destroy an exam'do
  @params = Test.new(
     {"title"=>"test", "description"=>"new", "questions_attributes"=>[{"questionTitle"=>"new", "questionDetail"=>"new"}], "options_attributes"=>[{"optionTitle"=>"new", "optionCorrect"=>"1"}]}
  )
  params = @params.destroy
  expect(params).to be_valid
  end

end
