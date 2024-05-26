require 'httparty'

class WeatherApi
include HTTParty

base_uri 'https://api.openweathermap.org/data/2.5'

def initialize(api_key)
@options = { query: { appid: api_key} }
end

def weather_by_city(city)
self.class.get("/weather?q=#{city}", @options)
end
end
