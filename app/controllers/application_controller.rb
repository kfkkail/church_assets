# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include Pundit
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!, except: %i[home about contact]

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authenticated

  def home; end

  def about; end

  def contact; end

  def secret; end

  protected

  def after_sign_in_path_for(_resource)
    articles_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name])
    devise_parameter_sanitizer.permit(:account_update,
                                      keys: %i[first_name last_name])
  end

  def user_not_authenticated
    render :unauthorized
  end
end
