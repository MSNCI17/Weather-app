class HomeController < ApplicationController
  def index
    @weather_data = build_weather_data
  end

  def city
    @city_name = params[:name]
    city_data = CITIES_DICTIONARY.select {|k, v| k == @city_name}

    require 'net/http'
    require 'json'
    @url = "https://api.darksky.net/forecast/c1a83c400c774757eae9c09a71e5abc1/#{city_data['latitude']},#{city_data['longitude']}"
    @uri = URI(@url)
    @response = Net::HTTP.get(@uri)
    @output = JSON.parse(@response)
  end

  private

  def build_weather_data
    @weather_data = {}
    CITIES_DICTIONARY.each do |city, data|
      location = DarkSky::Location.new([data["latitude"],  data["longitude"]])
      temperature = location.current.temperature
      icon = location.current.icon
      puts "tempera ture: #{temperature}" # actual air temperature
      puts "icon like: #{icon}" # apparent temperature
      @weather_data[city] =  { temperature: temperature, icon: icon }
    end
    @weather_data
  end

end