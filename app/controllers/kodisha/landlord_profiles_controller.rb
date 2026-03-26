class Kodisha::LandlordProfilesController < ApplicationController
  before_action only: %i[:show]
  allow_roles "admin", only: [ :index, :create, :update ]
  def index
    @landlord_profile = LandlordProfile.all
    render json: @landlord_profile
  end

  def show
  end

  def create
    @landlord_profile = LandlordProfile.new(landlord_profile_params)
    if @landlord_profile.save
      render json: @landlord_profile, status: :created, location: @landlord_profile
    else
      render json: { "error": @landlord_profile.errors }
    end
  end

  def update
  end
  private
  def set_landlord_profile
    @landlord_profile = LandlordProfile.find(params[:id])
  end
  def landlord_profile_params
    params.require(:landlord_profile).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
