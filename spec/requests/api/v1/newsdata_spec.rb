
# Creating Controller Rspec Tests
# HELP_FIND_BACK CONTROLLER, NEWSDATA
require 'swagger_helper'

RSpec.describe 'api/v1/newsdata', type: :request do
  # User Authentication
  let(:user1) { FactoryBot.create(:user) }
  let (:token){Warden::JWTAuth::UserEncoder.new.call(user1,:user,nil)}
  let(:Authorization){ "Bearer "+ token[0]}

  # Response
  path '/api/v1/newsdata' do

    get("List Newsdata Query") do
      tags 'Newsdata'
      produces 'application/json'
      security [Bearer: {}]
      response(200, 'successful') do
        after do |example|
          example.metadata[:response][:examples] = { 'application/json' => JSON.parse(response.body, symbolize_names: true) }
        end
        run_test!
      end
    end

  end
end
