
# In general, REST operations other than registration and logon require authentication. So we need a method to verify that a user has been authenticated. We create that method in a new file you should create, app/controllers/concerns/authentication_check.rb, as follows:
module AuthenticationCheck
  extend ActiveSupport::Concern

  def is_user_logged_in
    if current_user.nil?
      render json: { message: "Zero users authenticated." },
        status: :unauthorized
    end
  end
end
