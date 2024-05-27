class WeatherController < ApplicationController
    def index
      begin
        api_key = 'Enter API Key Here'
        api = WeatherApi.new(api_key)
        @city = params[:city] || 'New York'
        @weather = api.weather_by_city(@city)
  
        @username = params[:username]
  
        if @username.present?
          @user = User.find_by(username: @username)
  
          if @user
            @greeting = "Welcome back, #{@username}!"
          else
            @user = User.create(username: @username)
            @greeting = "Welcome, #{@username}!"
          end
        end
  
      rescue StandardError => e
        flash[:error] = "Error fetching weather data: #{e.message}"
        redirect_to root_path and return 
      end
    end
  end
  
