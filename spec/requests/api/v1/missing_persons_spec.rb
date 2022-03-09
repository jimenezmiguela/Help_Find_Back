
# Creating Controller Rspec Tests
# HELP_FIND_BACK CONTROLLER, MISSING_PERSONS
require 'swagger_helper'

RSpec.describe 'api/v1/missing_persons', type: :request do
  let(:user1) { FactoryBot.create(:user) }
  let (:token){Warden::JWTAuth::UserEncoder.new.call(user1,:user,nil)}
  let(:Authorization){ "Bearer "+ token[0]}
  let!(:missing_persons) { FactoryBot.create_list(:missing_person, 10) }
  let(:missing_person_id) { missing_persons.first.id }

  path '/api/v1/missing_persons' do

    get("List All Missing Persons' Files") do
      tags 'Missing Persons'
      produces 'application/json'
      security [Bearer: {}]
      response(200, 'successful') do
        after do |example|
          example.metadata[:response][:examples] = { 'application/json' => JSON.parse(response.body, symbolize_names: true) }
        end
        run_test!
      end
    end

    post('Create A Missing Person File') do
      tags 'Missing Persons'
      consumes 'application/json'
      produces 'application/json'
      security [Bearer: {}]
      parameter name: :missing_person, in: :body, required: true, schema: {
        type: :object,
        required: %i[name sex race],
        properties: {
          name: { type: :string },
          sex: { type: :string },
					race: { type: :string }
        }
      }

      response(201, 'successful') do
        let(:missing_person) { { name: "Jane Koe", sex: "female", race: "Mexican" }}

        after do |example|
          example.metadata[:response][:examples] = { 'application/json' => JSON.parse(response.body, symbolize_names: true) }
        end
        run_test!
      end
    end
  end

  path '/api/v1/missing_persons/{id}' do
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('Show A Missing Person File') do
      tags 'Missing Persons'
      security [Bearer: {}]
      response(200, 'successful') do
        let(:id) { missing_person_id }

        after do |example|
          example.metadata[:response][:examples] = { 'application/json' => JSON.parse(response.body, symbolize_names: true) }
        end
        run_test!
      end
    end

    patch("Update A Missing Person's File") do
      tags 'Missing Persons'
      consumes 'application/json'
      produces 'application/json'
      security [Bearer: {}]
      parameter name: :missing_person, in: :body, schema: {
        type: :object,
        properties: {
				name: { type: :string },
				sex: { type: :string },
				race: { type: :string }
        }
      }
      response(200, 'successful') do
        let(:id) { missing_person_id }
        let(:missing_person) {{name: 'fred'}}
        after do |example|
          example.metadata[:response][:examples] = { 'application/json' => JSON.parse(response.body, symbolize_names: true) }
        end
        run_test!
      end
    end

    put("Update A Missing Person's File") do
      tags 'Missing Persons'
      consumes 'application/json'
      produces 'application/json'
      security [Bearer: {}]
      parameter name: :missing_person, in: :body, schema: {
        type: :object,
        properties: {
				name: { type: :string },
				sex: { type: :string },
				race: { type: :string }
        }
      }
      response(200, 'successful') do
        let(:id) { missing_person_id }
        let(:missing_person) {{name: 'fred'}}

        after do |example|
          example.metadata[:response][:examples] = { 'application/json' => JSON.parse(response.body, symbolize_names: true) }
        end
        run_test!
      end
    end

    delete("Delete A Missing Person's File") do
      tags 'Missing Persons'
      security [Bearer: {}]
      response(200, 'successful') do
        let(:id) { missing_person_id }

        after do |example|
          example.metadata[:response][:examples] = { 'application/json' => JSON.parse(response.body, symbolize_names: true) }
        end
        run_test!
      end
    end
  end
end
