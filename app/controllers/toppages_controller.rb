class ToppagesController < ApplicationController
  
  include ToppagesHelper
  
  def index
  end
  
  def create
    
  end
  
  def getVisionAPIresult
    
    data_json = changeParamsToJSON(params[:requests])
    result_json = getJSONfromVisionAPI(data_json)
    
    render :json => result_json
  end
end
