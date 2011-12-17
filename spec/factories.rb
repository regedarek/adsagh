# encoding: UTF-8
Factory.sequence :email do |n|
  "czesioo#{n}@example.com"
end
Factory.define :ad do |f|
  f.sequence(:title) { |n| "Nerka#{n}" }
  f.sequence(:name) { |n| "czesio#{n}" }
  f.email { Factory.next(:email) }
  f.sequence(:ad_content) { |n| "Ja Czesio#{n} piszę sobie tutaj ogłoszenie." }
  f.phone_number "662284020"
  f.price "6,66"
end

Factory.define :admin do |a|
  a.username 'rege'
  a.email {|a| "#{a.username}@example.com".downcase }
  a.password 'z'
end

