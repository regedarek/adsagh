# encoding: UTF-8
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

  def send_edit_link(ad)
    @ad = ad
    mail :to => ad.email, :subject => "Edytuj ogłoszenie"
  end

  def send_finish_info(ad)
    @ad = ad
    mail :to => ad.email, :subject => "Ogłoszenie zostanie zakończone"
  end

  def why_discard(ad, discard_info)
    @discard_info = discard_info
    mail(:to => ad.email, :subject => "Dlaczego odrzucone")
  end
end
