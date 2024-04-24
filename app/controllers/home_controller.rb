class HomeController < ApplicationController
  def index
    @address = params[:address]

    if @address.present?
      location = Geocoder.search(@address).first
      if location.present?
        @latitude = location.latitude
        @longitude = location.longitude
        cached_data = CacheService.new.get_cache(location&.postal_code) if location&.postal_code

        if cached_data.present?
          @forecast = JSON.parse(cached_data, symbolize_names: true)
          @cache_used = true
        else
          weather_service = WeatherService.new(@latitude, @longitude)
          begin
            @forecast = weather_service.fetch_weather
          rescue StandardError => e
            flash[:alert] = "Error fetching weather data: #{e.message}"
            @forecast = nil
          end
          CacheService.new.set_cache(location&.postal_code, @forecast.to_json) if @forecast
        end
      else
        flash[:alert] = 'Invalid address provided.'
      end
    end
  end
end
