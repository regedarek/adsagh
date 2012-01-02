# encoding: UTF-8
class ApplicationController < ActionController::Base
  protect_from_forgery

  private
  
  def not_authenticated
    redirect_to root_url, :alert => "Musisz być zalogowany!"
  end

  def default_url_options(options = nil)
    {:format => "html"}
  end

end
