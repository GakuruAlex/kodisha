class TenantProfilesController < ApplicationController
  before_action :set_tenant_profile, only: [ :show ]
    def index
      @tenant_profiles = TenantProfile.all
    end

    def show
    end

    private

    def set_tenant_profile
        @tenant_profile = TenantProfile.find(params[:id])
    end

    def tenant_profiles_params
      params.require(:tenant_profile).permit(:firstname, :lastname, :phonenumber)
    end
end
