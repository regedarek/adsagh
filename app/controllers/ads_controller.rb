# encoding: UTF-8
class AdsController < ApplicationController
  # params[:action] == 'show' ? 'show_wrapper' : 'everything_else_wrapper'

  def index
  	@ads = Ad.all
  end

  def new    
    @ad = Ad.new
  end

  def create    
    if @ad.save
      AdMailer.ad_token(@ad).deliver
      redirect_to root_path 
      flash[:notice_item] = "Ogłoszenie przekazane do weryfikacji." 
    else
      render :action => "new"
  	end
  end

  
  def confirm
    @ad = Ad.find(params[:id])
    @advertiser = Advertiser.find_or_create_by_email(
      :email => @ad.email,
      :name => @ad.name,
      :phone_number => @ad.phone_number
    )
    if @ad.token == params[:token]
      @ad.email_id = @advertiser.id
      @ad.save
      flash[:notice_item] = "potwierdzono" 
    else
      flash[:notice_item] = "błędny kod potwierdzający"
    end
    redirect_to root_path
  end

  def show
  	@ad = Ad.find(params[:id])
    @ad.update_attribute 'display_counter', @ad.display_counter + 1
  end
end
