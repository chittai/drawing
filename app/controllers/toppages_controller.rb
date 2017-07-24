class ToppagesController < ApplicationController
  
  include ToppagesHelper
  
  def index
  end
  
  def create
    name = params[:name]
    filename = params[:filename]
    score = params[:score]
    
    drawing_score = Toppage.new(filename: filename, name: name, score: score)
    drawing_score.save
  end
  
  def getVisionAPIresult
    data_json = changeParamsToJSON(params[:requests])
    result_json = getJSONfromVisionAPI(data_json)
    
    render :json => result_json
  end
  
  def getData
    score_array = [] 
    datas = Toppage.order(score: :desc).all
    
    datas.each do |data|
      score = data[:score]
      score_array << score
    end
    
    render :text => score_array
    
  end
  
end
