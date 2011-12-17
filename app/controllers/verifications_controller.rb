# encoding: UTF-8
class VerificationsController < ApplicationController
  before_filter :require_login
  def index
    @ads = Ad.where("email_id IS NOT NULL AND verification_date IS NULL")
  end

  def verify
    @ad = Ad.find(params[:id])
    @ad.update_attribute :verification_date, Time.now
    redirect_to verifications_path
    flash[:notice] = "Zweryfikowano pomyślnie!"
  end

  def discard 
    @ad = Ad.find(params[:id])
    @discard_info = "bo sie nie nadaje"
    if AdMailer.why_discard(@ad, @discard_info).deliver
    @ad.destroy
    end
    redirect_to verifications_path
    flash[:notice] = "Odrzucono ogłoszenie!"
  end
end
