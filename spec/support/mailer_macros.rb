module MailerMacros
  def last_email
    ActionMailer::Base.deliveries.last
  end

  def send_confirm_token
    ActionMailer::Base.deliveries = []
  end
end
