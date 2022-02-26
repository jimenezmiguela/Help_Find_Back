
class Api::V1::NewsdataController < ApplicationController
  def index

    require 'uri'
    require 'net/http'

    uri = URI('https://newsdata.io/api/1/news?'+"#{Rails.application.credentials.devise[:newsdata_secret_key]}"+'&country=us&language=en&q=missing%20AND%20person')
    @res = Net::HTTP.get_response(uri)
    puts @res.body if @res.is_a?(Net::HTTPSuccess)

    render json: @res.body

  end
end
