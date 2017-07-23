class ToppagesController < ApplicationController
  
  include ToppagesHelper
  
  def index
  end
  
  def getVisionAPIresult
    data_json = makeJSONforPOST(params[:dataURL])
    
    result_json = getJSONfromVisionAPI(data_json)
    
    render :json => result_json
    
  end
end
