class ServiceObject::HttpRequestService
  def self.http_get_request(word)
    result = {
      "status_code" => 0,
      "definition" => "N/A",
      "message" => ""
    }
    headers = { 
      "app_id" => ENV["APP_ID"],
      "app_key" => ENV["APP_KEY"]
    }
    begin 
      response = HTTParty.get(
        "https://od-api.oxforddictionaries.com/api/v2/words/en-gb?q=" + word,
        :headers => headers
      )
      result["status_code"] = response.code
      case result["status_code"]
      when 200
        hash = JSON.parse(response.body)
        result["message"] = "Word was found"
        result["definition"] = hash['results'][0]['lexicalEntries'][0]['entries'][0]['senses'][0]['definitions'][0]
        return result
      when 400
        result["message"] = "Bad Request"
        return result
      when 403
        result["message"] = "Authentication failed"
        return result
      when 404
        result["message"] = "Word Not Found"
        return result
      when 414
        result["message"] = "Request URI Too Long"
        return result
      when 500
        result["message"] = "Internal Server Error"
        return result
      when 502
        result["message"] = "Bad Gateway"
        return result
      when 503
        result["message"] = "Service Unavailable"
        return result
      when 504
        result["message"] = "Gateway timeout"
        return result
      end
      rescue HTTParty::Error => error
        Rails.logger.fatal error.inspect
      rescue => error
        Rails.logger.fatal error.inspect
      result["message"] = error.inspect
      return result
    end
  end
end