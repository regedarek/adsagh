# encoding: UTF-8
class SessionsController < ApplicationController
  def new
  end
  
  def create
    admin = login(params[:username], params[:password])
    if admin
      redirect_back_or_to root_url, :notice => "Zalogowano pomyślnie!"
    else
      flash.now.alert = "Źle wpisałeś nazwę lub hasło!"
      render :new
    end
    
    def destroy
      logout
      redirect_to root_url, :notice => "Wylogowano pomyślnie"
    end
  end
end
