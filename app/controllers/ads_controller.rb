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

  def show
  	@ad = Ad.find(params[:id])
    @ad.update_attribute 'display_counter', @ad.display_counter + 1
  end
end
