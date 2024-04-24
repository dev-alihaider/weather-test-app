class WeatherService
    API_KEY = '569094c915caad5a03e26a2596500ad4'
  
    def initialize(latitude, longitude)
      @latitude = latitude
      @longitude = longitude
    end
  
    def fetch_weather
      url = "https://api.openweathermap.org/data/2.5/weather?lat=#{@latitude}&lon=#{@longitude}&appid=#{API_KEY}"
      response = RestClient.get(url)
      data = JSON.parse(response.body)
      
      # Extract relevant data (modify as needed)
      current_temp = data['main']['temp']
      high_temp = data['main']['temp_max']
      low_temp = data['main']['temp_min']
      
      { current_temp: current_temp, high: high_temp, low: low_temp }
    end
  end
  