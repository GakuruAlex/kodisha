class Landlord::Estate::HousesController < ApplicationController
  before_action :set_estate, only: %i[ index create show]
  before_action :set_house, only: %i[ show ]
  allow_roles "member", only: %i[index show create]
  def index
    houses = @estate.houses
    render json: houses, status: 200
  end

  def show
    render json: @house
  end

  def create
    estate_house = @estate.houses.create(house_params)
    if estate_house.persisted?
      render json: estate_house, status: 201
    else
      render json: { "error": estate_house.errors.full_message }, status: 403
    end
  end

  private
  def set_estate
    @estate = current_user.landlord_profile.estates.find(params[:estate_id])
  end

  def set_house
    @house = @estate.houses.find(params[:house_id])
  end
  def house_params
    params.require(:house).permit(:house_name, :house_type, :is_occupied)
  end
end
