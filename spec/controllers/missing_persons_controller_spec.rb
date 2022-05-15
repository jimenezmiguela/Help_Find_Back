require "rails_helper"

RSpec.describe Api::V1::MissingPersonsController, type: :controller do
    it 'has a max limit of 20' do 
        expect(MissingPerson).to receive(:limit).with(20).and_call_original
        
        get :index, params: { limit: 200 }
    end
end