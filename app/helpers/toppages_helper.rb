module ToppagesHelper
  def getVisionAPIresult(data)
    require 'net/http'
    api_key= @google_vision_api_key
    
    uri = URI.parse "https://vision.googleapis.com/v1/images:annotate?key=#{api_key}"
    
    request = Net::HTTP::Post.new(uri.request_uri, initheader = {'Content-Type' => 'application/json'})
    request.body = data
    
    response = Net::HTTP.start(uri.host, uri.port, use_ssl: uri.scheme == 'https') do |http|
        http.request(request)
    end
    
    p "response"
    p response
    
  end
  
  def makeJSON(dataURL)
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
end
