
class Api::V1::MissingPersonsController < ApplicationController
  include AuthenticationCheck

  before_action :is_user_logged_in
  before_action :set_missing_person, only: [:show, :update, :destroy]

  MAX_PAGINATION_LIMIT = 3

  # GET /missing_persons
  def index
    @missingPersons = MissingPerson.limit(limit).offset(params[:offset])
    render json: @missingPersons
  end

  # GET /missing_persons/:id
  def show
    @missingPerson = MissingPerson.find(params[:id])
    if @missingPerson = MissingPerson.find(params[:id])
      render json: @missingPerson, status: 200
      # 200:  successfully found it
    else
      render json: {error:
        "Could not display show missing person: #{@missingPerson.errors.full_messages.to_sentence}"},
        status: 204
        # 204:  No content
    end
  end

    # POST /missing_persons
    def create
      @missingPerson = MissingPerson.new(missing_person_params)
      if @missingPerson.save
        render json: @missingPerson, status: 201
        # 201:  successfully created
      else
        render json: { error:
          "Could not create missing person: #{@missingPerson.errors.full_messages.to_sentence}"},
          status: 400
          # 400: bad request
      end
    end

      # PUT /missing_persons/:id
      def update
        @missingPerson = MissingPerson.find(params[:id])
        if @missingPerson.update(missing_person_params)
          render json: @missingPerson

        else
          render json: {error:
            "Could not update missing person: #{@missingPerson.errors.full_messages.to_sentence}"},
            status: 404
            # 404:  Not found
        end
      end

    # DELETE /missing_persons/:id
    def destroy
      @missingPerson.destroy
      render json: { message: 'You have deleted missing person record.'}, status: 200
    end

    private

    def limit
       [
         params.fetch(:limit, MAX_PAGINATION_LIMIT).to_i, 
         MAX_PAGINATION_LIMIT
       ].min
    end

    def missing_person_params
      # params.permit(:name, :age, :sex, :hair_color, :weight, :race)
      params.require(:missing_person).permit(:name, :age, :sex, :hair_color, :weight, :race)
    end

    def set_missing_person
      @missingPerson = MissingPerson.find(params[:id])
    end

  end
