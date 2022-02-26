
# sessions_controller.rb,
# It is not really obvious what this controller does, but it overrides the Devise controller to handle JSON responses.
class Users::SessionsController < Devise::SessionsController
  respond_to :json

  private

  def respond_with(resource, _opts = {})
    if !resource.id.nil?
      response.set_header('Access-Control-Expose-Headers','authorization')
      render json: { message: 'Log in success.' }, status: :created
    else
      render json: { message: 'Log in failure.'}, status: :unauthorized
    end
  end

  def respond_to_on_destroy
    log_out_success && return if current_user

    log_out_failure
  end

  def log_out_success
    render json: { message: "Logged out." }, status: :ok
  end

  def log_out_failure
    render json: { message: "Log out failure."}, status: :unauthorized
  end
end


# ORIGINAL
# class Users::SessionsController < ApplicationController
# end
