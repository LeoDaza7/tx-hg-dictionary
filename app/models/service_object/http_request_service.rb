class ServiceObject::HttpRequestService
  def self.http_get_request(word)
    headers = { 
      "app_id" => ENV["APP_ID"],
      "app_key" => ENV["APP_KEY"]
    }    
    response = HTTParty.get(
      "https://od-api.oxforddictionaries.com/api/v2/words/en-gb?q=" + word,
      :headers => headers
    )
    case response.code
    when 200
      hash = JSON.parse(response.body)
      return hash['results'][0]['lexicalEntries'][0]['entries'][0]['senses'][0]['definitions'][0]
    when 400..600
      return "Not found"
    end
  end
end