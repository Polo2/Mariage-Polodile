class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_locale
  before_action :authenticate_user!
  before_action :set_user_weddings, :if => :user_signed_in?
  before_action :configure_permitted_parameters, if: :devise_controller?

  include Pundit

   # Pundit: white-list approach.
  # after_action :verify_authorized, except: :index, unless: :skip_pundit?
  # after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :avatar])
    devise_parameter_sanitizer.permit(:account_update, keys: [:avatar])
  end

  private

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/ || questions_controller?
  end

  def set_user_weddings
    @user_weddings = current_user.weddings
  end

  def set_locale
    # I18n.locale = params.fetch(:locale, I18n.default_locale).to_sym
    I18n.locale = I18n.default_locale
  end

  # def default_url_options
  #   { locale: I18n.locale }
  # end²

end
