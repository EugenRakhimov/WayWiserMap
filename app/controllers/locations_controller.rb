class LocationsController < ApplicationController
  include LocationsHelper
  def index
    # For the sake of example center point by default is set in Auckland
    northEast = point_to_float(params[:northEast])
    southWest = point_to_float(params[:southWest])    
    center_point = {lat:-36.8485,lng:174.7633} if !northEast
    center_point = point_to_float(params[:centerPoint]) if northEast    
    locations = Location.around(center_point,southWest, northEast)    
    render json: {center_point:center_point, locations:locations}
  end
  
end
