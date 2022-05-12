require 'rails_helper'

describe 'MissingPerson', type: :request do
    describe 'GET /missing_persons' do

        it 'returns a subset of books based on pagination' do
            get '/api/v1/missing_persons', params: { limit: 3 }

            expect(response).to have_http_status("success")
            expect(response_body.size).to eq(3)
            expect(response_body).to eq(
                [
                    {
                        'ID'=> 1,
                        'Name'=> 'TAMMY MAHONEY',
                        'Sex'=> 'Female',
                        'Race'=> 'White',
                        'Age'=> 'null',
                        'Hair Color'=> 'Brown',
                        'Weight'=> 130
                    },
            
                    {
                        'ID'=> 2,
                        'Name'=> 'MARK RANDALL FRERICHS',
                        'Sex'=> 'Male',
                        'Race'=> 'White',
                        'Age'=> 'null',
                        'Hair Color'=> 'Brown',
                        'Weight'=> 190
                    },

                    {
                        'ID'=> 3,
                        'Name'=> 'WALTER GREG FOWLER - SMITHS GROVE, KENTUCKY',
                        'Sex'=> 'Male',
                        'Race'=> 'White',
                        'Age'=> 'null',
                        'Hair Color'=> 'Brown',
                        'Weight'=> 220
                    }
                ]
            )
        end 

        it 'returns a subset of missing_persons based on limit and offset' do
            get '/api/v1/missing_persons', params: { limit: 3, offset: 3 }

            expect(response).to have_http_status('success')
            expect(response_body.size).to eq(3)
            expect(response_body).to eq(
                [
            
                    {
                        'ID'=> 2,
                        'Name'=> 'MARK RANDALL FRERICHS',
                        'Sex'=> 'Male',
                        'Race'=> 'White',
                        'Age'=> 'null',
                        'Hair Color'=> 'Brown',
                        'Weight'=> 190
                    },

                    {
                        'ID'=> 3,
                        'Name'=> 'WALTER GREG FOWLER - SMITHS GROVE, KENTUCKY',
                        'Sex'=> 'Male',
                        'Race'=> 'White',
                        'Age'=> 'null',
                        'Hair Color'=> 'Brown',
                        'Weight'=> 220
                    }
                ]
            )
        end
    end          
end