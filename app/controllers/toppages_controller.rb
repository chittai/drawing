class ToppagesController < ApplicationController
  
  include ToppagesHelper
  
  def index
    @google_vision_api_key = ENV['GOOGLE_VISION_API_KEY']
  end
  
  def getVisionAPIresult
    put "test"
  end
  
end
