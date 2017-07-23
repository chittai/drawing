module ToppagesHelper
  
  def makeJSONforPOST(dataURL)
    data = {
      requests:[
        {
          image:{
            content: dataURL
          },
          features:{
            type: "LABEL_DETECTION",
            maxResults: 100
          }
        }
      ]
    }.to_json
    
    return data
  end
  
  def create
    
  end
  
  def getJSONfromVisionAPI(data_json)
    require 'net/http'
    api_key= ENV['GOOGLE_VISION_API_KEY']
    
    uri = URI.parse "https://vision.googleapis.com/v1/images:annotate?key=#{api_key}"
    
    request = Net::HTTP::Post.new(uri.request_uri, initheader = {'Content-Type' => 'application/json'})
    request.body = data_json
    
    response = Net::HTTP.start(uri.host, uri.port, use_ssl: uri.scheme == 'https') do |http|
        http.request(request)
    end
    
    body = JSON.parse(response.body)
    return body
    
    #responses = body['responses']
    #return responses
  end
  
end
