# encoding: UTF-8
class ApplicationController < ActionController::Base
  protect_from_forgery

  private
  
  def not_authenticated
    redirect_to root_url, :alert => "Musisz być zalogowany!"
  end
end
