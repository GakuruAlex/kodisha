class ApplicationController < ActionController::API
  include Authentication
  include Authorization
end
