class WelcomeController < ApplicationController
  def index

    
   @states = %w(HI AK CA OR WA ID UT NV AZ NM CO WY MT ND SD NB KS OK TX LA AR MO IA MN WI IL IN MI OH KY TN MS AL GA FL SC NC VA WV DE MD PA NY NJ CT RI MA VT NH ME DC )
    
   @states.sort!


    if params[:city] != nil
       params[:city].gsub! " ", "_"
    end
    
    if params[:city] != nil
        response = HTTParty.get("http://api.wunderground.com/api/add102bb5269079b/geolookup/conditions/q/#{params[:state]}/#{params[:city]}.json")
        if response["location"] == nil
          redirect_to index_path   
        else
       
    @location = response["location"]["city"]
    @temp_f = response["current_observation"]["temp_f"]
    @temp_c = response["current_observation"]["temp_c"]
    @weather_icon = response["current_observation"]["icon_url"]
    @weather_words = response["current_observation"]["weather"]
    @forecast_link = response["current_observation"]["forecast_url"]
    @real_feel = response["current_observation"]["feelslike_f"]
        end
    end
      if @weather_words == "Overcast"
    	@url = "http://barbwire.com/wp-content/uploads/2014/02/SochiSucks.jpg"
    elsif @weather_words == "Clear"
    	@url = "http://p1.pichost.me/i/12/1352901.jpg"
    elsif @weather_words == "Scattered Clouds"
    	@url = "http://www.wallpapersis.com/wp-content/uploads/2014/10/Scattered-Clouds-.jpg"
    elsif @weather_words == "Light Snow"
    	@url = "https://weedonder.files.wordpress.com/2013/01/ph_photography-11-of-11.jpg"
    elsif @weather_words == "Partly Cloudy"
    	@url = "http://wallpoper.com/images/00/44/82/22/cloudy_00448222.jpg"
    elsif @weather_words == "Snow"
    	@url = "http://cdn.bgr.com/2015/01/blizzard-2015.jpg"
    elsif @weather_words == "Frost"
    	@url = "http://74211.com/wallpaper/picture_big/Trees-Alongside-the-River-Are-Full-of-Snow-Coldness-is-Easy-to-Imagine-Yet-the-Sun-is-Coming-Out-There-is-Anticipation-HD-Natural-Scenery-Wallpaper.jpg"
    else
    	@url = "http://www.morrobayrealty.com/files/2015/04/rainy_day_wallpaper_2.jpeg"
      end
  end
end