class Api::V1::TwitterController < ApplicationController
  include AuthenticationCheck

  before_action :is_user_logged_in

  def index
    # Twitter
    require 'net/http'

    uri = URI("https://api.twitter.com/2/tweets/search/recent?query=missing%20person")
    @req = Net::HTTP::Get.new(uri)
    @req['Authorization'] = "#{Rails.application.credentials.devise[:twitter_secret_key]}"

    @res = Net::HTTP.start(uri.hostname, uri.port, use_ssl: uri.scheme == 'https') { |http|
      http.request(@req)
    }

    @res.body
    render json: @res.body

  end

end
