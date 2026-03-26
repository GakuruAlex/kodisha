class ApplicationController < ActionController::API
ActionController::Parameters.action_on_unpermitted_parameters = :raise
rescue_from ActionController::ParameterMissing, with: :required_params_missing
rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
rescue_from ActiveModel::UnknownAttributeError, with: :unknown_attribute_error
rescue_from ActionController::UnpermittedParameters, with: :unpermitted_parameter_error
rescue_from ArgumentError, with: :argument_error
  include Authentication
  include Authorization

  private
  def argument_error(exception)
    render json: { error: exception.message }, status: :unprocessable_entity
  end
  def required_params_missing(exception)
    render json: { error: exception.record.errors.to_hash }, status: :bad_request
  end
  def record_not_found(exception)
    render json: { error: exception.message }, status: :not_found
  end

  def unknown_attribute_error(exception)
    render json: { error: exception.message }, status: :bad_request
  end
  def unpermitted_parameter_error(exception)
    render json: {
      "Unpermitted attribute error": {
        params: exception.params
      }
    }, status: :bad_request
  end
end
