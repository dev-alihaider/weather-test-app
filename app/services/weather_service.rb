class WeatherService
    API_KEY = ENV['WEATHER_API_KEY']

    def initialize(latitude, longitude)
      @latitude = latitude
      @longitude = longitude
    end
  
    def fetch_weather
      url = "https://api.openweathermap.org/data/2.5/weather?lat=#{@latitude}&lon=#{@longitude}&appid=#{API_KEY}"
      response = RestClient.get(url)
      data = JSON.parse(response.body)
      
      current_temp = data['main']['temp']
      high_temp = data['main']['temp_max']
      low_temp = data['main']['temp_min']
      
      { current_temp: current_temp, high: high_temp, low: low_temp }
    end
  end
  