# encoding: UTF-8
class SessionsController < ApplicationController
  def new
  end

  def create
    admin = login(params[:username], params[:password])
    if admin
      redirect_back_or_to verifications_path, notice: t('authentication.login_succesfully')
    else
      flash.now.alert = t('authentication.login_unsuccesfully') 
      render :new
    end
  end    

  def destroy
    logout
    redirect_to root_url, notice: t('authentication.logout') 
  end
end
