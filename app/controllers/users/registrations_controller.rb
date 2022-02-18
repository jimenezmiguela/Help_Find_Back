
# UPDATED
# registrations_controller.rb
# It is not really obvious what this controller does, but it overrides the Devise controller to handle JSON responses.
class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  private

  def respond_with(resource, _opts = {})
    register_success && return if resource.persisted?

    register_failed
  end

  def register_success
    render json: { message: 'You are registered.' }, status: :created
  end

  def register_failed
    render json: { message: "Registration problem." }, status: :bad_request
  end
end


# ORIGINAL
# class Users::RegistrationsController < ApplicationController
# end
