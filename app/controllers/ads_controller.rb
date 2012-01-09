# encoding: UTF-8
class AdsController < ApplicationController
  before_filter :categories

  def index
    @ads = Ad.where("advertiser_id IS NOT NULL AND verification_date IS NOT NULL")
  end

  def new
    @ad = Ad.new
  end

  def create
    @ad = Ad.new(params[:ad])
    if msg = @ad.create_by(params[:ad][:email])
      cookies.permanent[:email] = [params[:ad][:email]]
      cookies.permanent[:name] = [params[:ad][:name]]
      cookies.permanent[:phone_number] = [params[:ad][:phone_number]]
      flash.notice = t("ad.create.#{msg}")
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @ad = Ad.find(params[:id])
    if @ad.token = params[:token] || logged_in?
    else
      redirect_to root_path, alert: t('ad.edit.wrong_token')
    end
  end

  def update
    @ad = Ad.find(params[:id])
    @ad.update_attributes(params[:ad])
    @ad.update_attributes(:verification_date => nil)
    if logged_in?
      redirect_to verifications_path, notice: t('ad.update')
    else
      redirect_to @ad, notice: t('ad.update')
    end
  end

  def show
    begin
      @ad = Ad.find(params[:id])
      @ad.update_attribute 'display_counter', @ad.display_counter + 1
    rescue ActiveRecord::RecordNotFound
      flash.alert=t("ad.not_found")
      redirect_to ads_path
    end
  end

#custom actions
  def auth
    auth = request.env["omniauth.auth"]
    session[:adv_email] = cookies.permanent[:email] = auth["info"]["email"]
    session[:adv_name] = cookies.permanent[:name] = auth["info"]["name"]
    session[:adv_phone] = cookies.permanent[:phone_number] = auth["info"]["phone"]
    redirect_to new_ad_path, notice: t('ad.auth.succesfully_authenticated')

  end
  
  def signout_advertiser
    # session[:adv_email] = session[:adv_name] = session[:adv_phone] = nil
    cookies.delete :email
    cookies.delete :name
    cookies.delete :phone_number 
    reset_session
    redirect_to root_url, notice: t('ad.auth.succesfully_destroy_session')
  end

  def confirm
    @ad = Ad.find(params[:id])
    if msg = @ad.confirm_by(params[:id], params[:token])
      redirect_to root_path, notice: t("ad.confirm.#{msg}")
    end
  end
end

private
def categories
    @roots = Category.where("ancestry IS NULL").order(:name)
    @categories = Category.arrange(:order=>:name)
end
