# encoding: UTF-8
class AdsController < ApplicationController
  before_filter :categories
  before_filter :load_ad, :only => [:edit, :update, :finish, :show, :confirm]

  def index
    @ads = Ad.all
  end

  def new
    @ad = Ad.new
    3.times { @ad.photos.build }
  end

  def create
    @ad = Ad.new(params[:ad])
    if msg = @ad.create_by(params[:ad][:email])
      cookies.permanent[:email] = [params[:ad][:email]]
      cookies.permanent[:name] = [params[:ad][:name]]
      cookies.permanent[:phone_number] = [params[:ad][:phone_number]]
      redirect_to root_path, notice: t("ad.create.#{msg}")
    else
      render :new
    end
  end

  def edit
    if @ad.token = params[:token] || logged_in?
      3.times { @ad.photos.build }
    else
      redirect_to root_path, alert: t('ad.edit.wrong_token')
    end
  end

  def update
    @ad.update!(params[:ad])
    if logged_in?
      redirect_to verifications_path, notice: t('ad.update')
    else
      redirect_to @ad, notice: t('ad.update')
    end
  end

  def show
    begin
      @ad.update_attribute 'display_counter', @ad.display_counter + 1
    rescue ActiveRecord::RecordNotFound
      flash.alert = t("ad.not_found")
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
    cookies.delete :email
    cookies.delete :name
    cookies.delete :phone_number
    reset_session
    redirect_to root_url, notice: t('ad.auth.succesfully_destroy_session')
  end

  def confirm
    if msg = @ad.confirm_by(params[:id], params[:token])
      redirect_to root_path, notice: t("ad.confirm.#{msg}")
    end
  end

  def finish
    if @ad.token = params[:token] || logged_in?
      @ad.finish
      redirect_to root_path, alert: t('ad.finish')
    else
      redirect_to root_path, alert: t('ad.edit.wrong_token')
    end
  end
end

private
  def load_ad
    @ad = Ad.find(params[:id])
  end

  def categories
    @roots = Category.where("ancestry IS NULL").order(:name)
    @categories = Category.arrange(:order=>:name)
  end
