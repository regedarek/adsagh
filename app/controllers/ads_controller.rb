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
    if @ad.token != params[:token]
      redirect_to root_path, alert: t('ad.edit.wrong_token') 
    end
  end

  def update
    @ad = Ad.find(params[:id])
    @ad.update_attributes(params[:ad])
    @ad.update_attributes(:verification_date => nil)
    redirect_to @ad, notice: t('ad.update') 
  end

  def show
  	@ad = Ad.find(params[:id])
    @ad.update_attribute 'display_counter', @ad.display_counter + 1
  end

#custom actions
  def auth
    auth = request.env["omniauth.auth"]
    cookies.permanent[:email] = auth["info"]["email"]
    cookies.permanent[:name] = auth["info"]["name"]
    cookies.permanent[:phone_number] = auth["info"]["phone"]
    redirect_to new_ad_path, notice: t('ad.auth.succesfully_authenticated')
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
