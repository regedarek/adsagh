# encoding: UTF-8
class AdsController < ApplicationController

  def index
  	@ads = Ad.all
  end

  def new
  	@ad = Ad.new
  end

  def create
  	@ad = Ad.new(params[:ad])

    if @ad.save
      AdMailer.ad_token(@ad).deliver
      redirect_to root_path 
      flash[:notice_item] = "Ogłoszenie przekazane do weryfikacji." 
    else
      render :action => "new"
  	end
  end

  def confirm
    # params[:action] == 'show' ? 'show_wrapper' : 'everything_else_wrapper'
    @ad = Ad.find(params[:id])
    if @ad.token == params[:token]
      flash[:notice_item] = "brawo"
      redirect_to root_path
    else
      flash[:notice_item] = "false"
      redirect_to root_path
    end
  end

  def show
  	@ad = Ad.find(params[:id])
    @ad.update_attribute 'display_counter', @ad.display_counter + 1
  end
end
