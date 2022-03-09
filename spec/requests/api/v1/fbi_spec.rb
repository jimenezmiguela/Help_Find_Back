
# Creating Controller Rspec Tests
# HELP_FIND_BACK CONTROLLER, FBI
require 'swagger_helper'

RSpec.describe 'api/v1/fbi', type: :request do
  # User
  let(:user1) { FactoryBot.create(:user) }
  let (:token){Warden::JWTAuth::UserEncoder.new.call(user1,:user,nil)}
  let(:Authorization){ "Bearer "+ token[0]}

  path '/api/v1/fbi' do

    get("List FBI Query") do
      tags 'FBI'
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
