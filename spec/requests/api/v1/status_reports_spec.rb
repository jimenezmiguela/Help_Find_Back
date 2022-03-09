
# Creating Controller Rspec Tests
# HELP_FIND_BACK CONTROLLER, STATUS_REPORTS
require 'swagger_helper'

RSpec.describe 'api/v1/status_reports', type: :request do
  # Initialize the test data
  let(:user1) { FactoryBot.create(:user) }
  let (:token){Warden::JWTAuth::UserEncoder.new.call(user1,:user,nil)}
  let(:Authorization){ "Bearer "+ token[0]}

  let!(:missing_person) { FactoryBot.create(:missing_person ) }
  let!(:status_reports) { FactoryBot.create_list(:status_report, 20, missing_person_id: missing_person.id) }
  let(:missing_person_id) { missing_person.id }
  let(:status_report_id) { status_reports.first.id }

  path '/api/v1/missing_persons/{missing_person_id}/status_reports' do
    parameter name: 'missing_person_id', in: :path, type: :string, description: 'missing_person_id'

    get('List All Status Reports') do
      tags 'Status Reports'
      security [Bearer: {}]
      response(200, 'successful') do

        after do |example|
          example.metadata[:response][:examples] = { 'application/json' => JSON.parse(response.body, symbolize_names: true) }
        end
        run_test!
      end
    end

    post('create status_report') do
      tags 'Status Reports'
      consumes 'application/json'
      produces 'application/json'
      security [Bearer: {}]
      parameter name: :status_report, in: :body, required: true, schema: {
        type: :object,
        required: %i[description details],
        properties: {
          description: {type: :string},
          details: {type: :string}
        }
      }
      response(201, 'successful') do
        let(:status_report) { { description: "This is a description.", details: "These are details."} }

        after do |example|
          example.metadata[:response][:examples] = { 'application/json' => JSON.parse(response.body, symbolize_names: true) }
        end
        run_test!
      end
    end
  end

  path '/api/v1/missing_persons/{missing_person_id}/status_reports/{status_report_id}' do
    parameter name: 'missing_person_id', in: :path, type: :string, description: 'missing_person_id'
    parameter name: 'status_report_id', in: :path, type: :string, description: 'id'

    get('show status_report') do
      tags 'Status Reports'
      security [Bearer: {}]
      response(200, 'successful') do

        after do |example|
          example.metadata[:response][:examples] = { 'application/json' => JSON.parse(response.body, symbolize_names: true) }
        end
        run_test!
      end
    end

    patch('update status_report') do
      tags 'Status Reports'
      consumes 'application/json'
      produces 'application/json'
      security [Bearer: {}]
      parameter name: :status_report, in: :body, required: true, schema: {
        type: :object,
        properties: {
				description: {type: :string},
				details: {type: :string}
        }
      }
      response(200, 'successful') do
        let(:status_report) { {description: "This is one more description."}}

        after do |example|
          example.metadata[:response][:examples] = { 'application/json' => JSON.parse(response.body, symbolize_names: true) }
        end
        run_test!
      end
    end

    put('update status_report') do
      tags 'Status Reports'
      consumes 'application/json'
      produces 'application/json'
      security [Bearer: {}]
          parameter name: :fact, in: :body, required: true, schema: {
        type: :object,
        properties: {
				description: {type: :string},
				details: {type: :string}
        }
      }
      response(200, 'successful') do
        let(:fact) {{ description: "This yet another description." }}

        after do |example|
          example.metadata[:response][:examples] = { 'application/json' => JSON.parse(response.body, symbolize_names: true) }
        end
        run_test!
      end
    end

    delete('delete status_report') do
      tags 'Status Reports'
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
