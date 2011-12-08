# encoding: UTF-8

Zakładając /^że jestem na stronie dodawania ogłoszenia$/ do
  visit '/ads/new' 
end

Jeżeli /^podam tytuł "([^"]*)"$/ do |arg1|
  fill_in 'ad_title', :with => arg1 
end

Jeżeli /^podam treść "([^"]*)"$/ do |arg1|
  fill_in 'ad_ad_content', :with => arg1
end

Jeżeli /^podam cenę "([^"]*)"$/ do |arg1|
  fill_in 'ad_price', :with => arg1
end

Jeżeli /^podam email "([^"]*)"$/ do |arg1|
  fill_in 'ad_email', :with => arg1

end

Jeżeli /^podam nazwę "([^"]*)"$/ do |arg1|
  fill_in 'ad_name', :with => arg1
end

Jeżeli /^kliknę przycisk dodaj ogłoszenie$/ do
  click_button 'Dodaj ogłoszenie'
end

Wtedy /^powinienem zobaczyć "([^"]*)"$/ do |arg1|
  assert page.has_content?(arg1)
end

