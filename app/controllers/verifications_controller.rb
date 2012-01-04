# encoding: UTF-8
class VerificationsController < ApplicationController
  before_filter :require_login
  def index
    @ads = Ad.where("advertiser_id IS NOT NULL AND verification_date IS NULL")
  end

  def verify
    @ad = Ad.find(params[:id])
    @ad.update_attribute :verification_date, Time.now
    @ad.update_attribute :admin_id, current_user.id
    redirect_to verifications_path, notice: t('ad.verify.succesfully_verified')
    @ad.send_edit_link
  end

  def discard_info
    @ad = Ad.find(params[:id])
  end

  def discard 
    @ad = Ad.find(params[:id])
    @discard_info = params[:discard_info]
    @ad.send_discard_info(@discard_info)
    @ad.destroy
    redirect_to verifications_path, notice: t('ad.discard.succesfully_dicarded')
  end
end
