class ApplicationController < ActionController::Base
   
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_locale
 
 #Sets the locale to the parameter specified in URL, or the default locale mentioned in config/application.rb
  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  
  def default_url_options(options = {})
  { locale: I18n.locale }.merge options
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

end
