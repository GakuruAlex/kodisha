class LandlordProfilesController < ApplicationController
  before_action only: %i[:show]
  def index
    @landlord_profile = LandlordProfile.all
    render json: @landlord_profile
  end

  def show
  end

  def new
    @landlord_profile = LandlordProfile.new
    render json: @landlord_profile
  end

  def create
    @landlord_profile = LandlordProfile.new(params[:landlord_profile])
    if @landlord_profile.save
      render json: @landlord_profile, status: :created, location: @landlord_profile
    else
      render "new"
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
