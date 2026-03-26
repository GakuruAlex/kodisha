class Landlord::EstatesController < ApplicationController
  before_action :set_estate, only: %i[show update]
  allow_roles "member", only: [ :index, :create, :show, :update ]
  def index
    if current_user.landlord_profile
      render json: current_user.landlord_profile.estates.includes(:houses), status: :ok
    else
      render json: { "error": current_user.errors.full_messages }, status: 403
    end
  end
  def create
      estate = current_user.landlord_profile.estates.new(name: estate_params[:name], location: estate_params[:location], has_vacancy: true)
      if estate.save
        render json: estate, status: 201
      else
        render json: estate.errors.to_hash, status: 422
      end
  end
  def show
    if @estate
      render json: @estate, status: 200
    else
      render json: { "error": @estate.errors.full_messages }, status: 403
    end
  end
  def update
    if @estate
      @estate.update(estate_params)
      if @estate.save
        render json: @estate, status: 200
      else
        render json: @estate.errors.full_messages, status: 403
      end
    else
      render json: { "errors": estate.errors.full_messages, status: 422 }, status: 403
    end
  end
  private
  def set_estate
    @estate = current_user.landlord_profile.estates.find(params[:id])
  end
  def estate_params
    params.require(:estate).permit(:name, :location, :has_vacancy)
  end
end
