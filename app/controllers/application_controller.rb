# encoding: UTF-8
class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_adv
  private
  
  def not_authenticated
    redirect_to root_url, alert: t('authentication.not_authenticated') 
  end
  
  def current_adv
    @current_adv ||= Advertiser.find_or_create_by_email(:email => session[:adv_email], :name => session[:adv_name], :phone_number => session[:adv_phone]) if session[:adv_email]
  end

  if Settings.url_with_html == true 
    def default_url_options(options = nil)
      {:format => "html"}
    end
  end
end
