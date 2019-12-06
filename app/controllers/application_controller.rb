class ApplicationController < ActionController::Base
    before_action :set_cities_list

    def set_cities_list
        @cities_list = CITIES_DICTIONARY.keys
    end
end
