
class Api::V1::FbiController < ApplicationController
  def index
    require 'uri'
    require 'net/http'

    uri = URI('https://api.fbi.gov/@wanted?pageSize=6&page=1&sort_on=modified&sort_order=desc&person_classification=victim')
    @res = Net::HTTP.get_response(uri)
    puts @res.body if @res.is_a?(Net::HTTPSuccess)


    render json: @res.body
  

  end
end
