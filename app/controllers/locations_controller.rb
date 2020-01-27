class LocationsController < ApplicationController
  def index
   @locations = Location.all
  end

  def show
    @location = Location.find(params[:id])
    @surfcamps = Surfcamp.select{|surfcamp| surfcamp if surfcamp.location_id == @location.id}
    # Another way of filtering results
    # @surfcamps = Surfcamp.where(location_id: @location.id)
  end

  def new
   @location = Location.new
  end

  def create
   @location = Location.create(review_params)
   redirect_to(locations_path)
  end

  def edit

  end

  def update
  @location = Location.find(params[:id])
  @location.update(review_params)

  end

  def destroy

  end

  def review_params
    params.require(:location).permit(:name,:description,:photo)
  end
end
