class AdMailer < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.ad_mailer.ad_token.subject
  #
  def ad_token(ad)
    @ad = ad

    mail :to => ad.email, :subject => "token" 
  end
end
