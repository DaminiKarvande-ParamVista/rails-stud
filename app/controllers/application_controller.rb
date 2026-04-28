class ApplicationController < ActionController::Base
  include Pundit::Authorization
  include Pagy::Backend

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  before_action :disply_greeting_message
  before_action :set_locale

  after_action :display_farewell_message

  allow_browser versions: :modern
  stale_when_importmap_changes

  protected

  def after_sign_in_path_for(resource)
    admin_dashboard_path
  end

  private

  def set_locale
    locale = params[:locale] || session[:locale] || I18n.default_locale
    if I18n.available_locales.map(&:to_s).include?(locale.to_s)
      session[:locale] = locale
      I18n.locale = locale
    else
      I18n.locale = I18n.default_locale
    end
  end

  def user_not_authorized
    flash[:alert] = t("flash.not_authorized")   # ✅ UPDATED to use i18n
    redirect_back(fallback_location: admin_students_path)
  end

  def disply_greeting_message
    puts "Hello, welcome to the Student Management System!"
  end

  def display_farewell_message
    puts "Goodbye, thank you for using the Student Management System!"
  end

  def pundit_user
    current_admin_user
  end
end