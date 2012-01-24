# encoding: UTF-8
class VerificationsController < ApplicationController
  before_filter :require_login
  before_filter :load_ad, :except => [:index]
  before_filter :verify_ad, :only => [:fast_verify, :verify]

  def index
    @ads = Ad.with_some_scope(params[:scope], params[:email])
    @last_unverified_ad = Ad.last_unverified
    @unverified_count = Ad.unverified_ads.count
    @unconfirmed_ads = Ad.unconfirmed_ads
    @confirmed_count = Ad.confirmed_ads.count
  end

  def verify_info
  end

  def fast_verify_info
  end

  def fast_verify
    redirect_to (Ad.unverified_empty? ? verifications_path : fast_verify_info_verification_path(Ad.last_unverified))
  end

  def verify
    redirect_to verifications_path, notice: t('ad.verify.succesfully_verified')
  end

  def discard_info
  end

  def discard
    @ad.discard!(params[:discard_info])
    redirect_to verifications_path, notice: t('ad.discard.succesfully_discarded')
  end

  private

  def load_ad
    @ad = Ad.find(params[:id])
    @last_unverified_ad = Ad.last_unverified
  end

  def verify_ad
    @ad.verify!(current_user.id)
  end
end
