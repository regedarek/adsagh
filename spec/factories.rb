# encoding: UTF-8
FactoryGirl.define do
  factory :ad do |f|
    f.title { "Nerka#{rand(10000)}" }
    f.name { "czesio#{rand(10000)}" }
    f.email { "czesio#{rand(100000)}@example.com" }
    f.ad_content { "Ja czesio#{rand(100000)} piszę sobie tutaj ogłoszenie." }
    f.phone_number "662284020"
    f.price "6,66"
    f.advertiser {|u| u.association(:advertiser)}
    f.admin {|a| a.association(:admin)}
    # f.email_id 1
    # f.verification_date Time.now
  end

  factory :advertiser do |a|
    a.name { "czesio#{rand(10000)}" }
    a.email { "czesio#{rand(100000)}@example.com" }
  end

  factory :admin do |a|
    a.username 'rege'
    a.email { "rege#{rand(100000)}@example.com" }
    a.password 'z'
  end
end
