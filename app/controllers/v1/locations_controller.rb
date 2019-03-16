class V1::LocationsController < ApplicationController
  before_action :set_location, only: [:show, :update, :destroy]

  def index
    @locations = Location.all

    render json: @locations
  end

  def show
    render json: @location
  end

  def create
    @location = Location.new(location_params)
    @location.save

    render_response(@location)
  end

  def update
    @location.update(location_params)

    render_response(@location)
  end

  def destroy
    @location.destroy
  end

  private

  def set_location
    @location = Location.find(params[:id])
  end

  def location_params
    params.fetch(:location, {}).permit(:title, :description, :latitude, :longitude)
  end
end
