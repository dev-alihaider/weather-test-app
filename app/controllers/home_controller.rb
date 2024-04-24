class HomeController < ApplicationController
  def index
    @address = params[:address]
    @cache_used = false

    if @address.present?
      # Geocoding
      location = Geocoder.search(@address).first
      if location.present?
        @latitude = location.latitude
        @longitude = location.longitude

        # Check cache (using safe navigation operator)
        cached_data = CacheService.new.get_cache(location&.postal_code) if location&.postal_code
        if cached_data.present?
          @forecast = JSON.parse(cached_data)
          # @forecast = cached_data
          @cache_used = true
        else
          # Fetch weather data
          weather_service = WeatherService.new(@latitude, @longitude)
          begin
            @forecast = weather_service.fetch_weather
          rescue StandardError => e
            flash[:alert] = "Error fetching weather data: #{e.message}"
            @forecast = nil  # Set forecast to nil to indicate error
          end
          
          CacheService.new.set_cache(location.postal_code, @forecast.to_json) if location&.postal_code && @forecast 
        end
      else
        flash[:alert] = 'Invalid address provided.'
      end
    end
  end
end
