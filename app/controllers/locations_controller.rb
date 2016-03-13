class LocationsController < ApplicationController
  def index
    # For the sace of example center point by default is set in Auckland
    center_point = {latitude:-36.8485,longitude:174.7633}
    locations = Location.around(center_point)    
    render json: {center_point:center_point, locations:locations}
  end
end
