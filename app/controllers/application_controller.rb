class ApplicationController < ActionController::API
rescue_from ActionController::ParameterMissing, with: :required_params_missing
  include Authentication
  include Authorization

  private
  def required_params_missing(exception)
    render json: { error: exception.message }, status: :bad_request
  end
end
