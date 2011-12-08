# encoding: UTF-8

Factory.define :ad do |f|
  f.sequence(:title) { |n| "Nerka#{n}" }
  f.sequence(:name) { |n| "Czesio#{n}" }
  f.sequence(:email) { |n| "sczesio#{n}@example.com" }
  f.ad_content "Sprzedam coś."
  f.phone_number "662284020"
  f.price "6,66"
end
