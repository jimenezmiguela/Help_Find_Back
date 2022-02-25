class Api::V1::TwitterController < ApplicationController
  include AuthenticationCheck

  before_action :is_user_logged_in

  def index
    # Twitter
    require 'net/http'

    uri = URI("https://api.twitter.com/2/tweets/search/recent?query=missing%20person")
    @req = Net::HTTP::Get.new(uri)
    @req['Authorization'] = "Bearer AAAAAAAAAAAAAAAAAAAAABXxZAEAAAAAHcdKR3uB5I2%2BgC%2FMZ%2BVrgWV49ag%3DK1yH0siCwoV84qiepRSaEtUBTOKfUiSXlddvTXsBtxKn91XNH3"

    @res = Net::HTTP.start(uri.hostname, uri.port, use_ssl: uri.scheme == 'https') { |http|
      http.request(@req)
    }

    @res.body
    render json: @res.body

  end

end
