class Kodisha::TenantProfilesController < Kodisha::BaseController
before_action :set_tenant_profile, only: [ :show ]

  def index
    tenant_profiles = User.all.where(role: :guest)
    render json: tenant_profiles
  end

  def show
    render json: @tenant_profile
  end

  private

  def set_tenant_profile
    @tenant_profile = TenantProfile.find(params[:id])
  end

  def tenant_profile_params
    params.require(:tenant_profile).permit(:firstname, :lastname, :phonenumber)
  end
end
