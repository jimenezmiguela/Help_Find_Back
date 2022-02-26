
# UPDATED
# This is just a test controller to verify that login works.
class TestController < ApplicationController
  include AuthenticationCheck

  before_action :is_user_logged_in

  def show
    render json: { message: "You are logged in!" },
      status: :ok
  end
end


# ORIGINAL
# class TestController < ApplicationController
# end
