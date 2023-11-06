class WeatherPresenter
    ACCEPTABLE_TEMPERATURE_FOR_READING_OUTSIDE = 15

    def initialize(data)
      @data = data
    end

    def current_data
        data['current']
    end
  
    def description
      current_data['condition']['text']
    end
  
    def temperature
      current_data['temp_c']
    end
  
    def icon
      current_data['condition']['icon']
    end
  
    def location
      data['location']['name']
    end
  
    def nice_weather?
      @description == 'Sunny' || @description == 'Partly cloudy'
    end
  
    def good_to_read_outside?
      nice_weather? && @temperature > ACCEPTABLE_TEMPERATURE_FOR_READING_OUTSIDE
    end
  
    def encourage_text
      if good_to_read_outside?
        "Get some snacks and go read a book in a park!"
      else
        "It's always a good weather to read a book!"
      end
    end
  
    private
      attr_reader :data
  end