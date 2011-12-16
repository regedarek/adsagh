class VerificationsController < ApplicationController
  before_filter :require_login
  def index
    @ads = Ad.where("email_id IS NOT NULL AND verification_date IS NULL")
  end

end
