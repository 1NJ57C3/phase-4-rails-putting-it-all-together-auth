class ApplicationController < ActionController::API
  include ActionController::Cookies
  before_action :authorize
  
  rescue_from ActiveRecord::RecordInvalid, with: :render_422

  private
    
  def authorize
    render json: { errors: ["Not authorized"] }, status: 401 unless session[:user_id]
  end

  def render_422 e
    render json: { errors: e.record.errors.full_messages }, status: 422
  end
end
