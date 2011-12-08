# encoding: UTF-8

Zakładając /^że jestem na stronie głównej$/ do
	Ad.create!(:title => "Nerka",
               :name => "Czesio",
               :email => "t@t.pl",
               :ad_content => "Sprzedam nerke nie smigana.",
               :phone_number => "662284020",
               :price => "5,43")
  visit '/' 
end

Jeżeli /^kliknę link ogłoszenia$/ do
  click_link "Nerka"
end

Wtedy /^zobaczę tytuł, treść oraz email ogłoszeniodawcy$/ do
  page.should have_content "Sprzedam nerke nie smigana."
  page.should have_content "Nerka"
  page.should have_content "t@t.pl"
  page.should have_content "5.43"
  page.should have_content "Czesio"
end

Wtedy /^zobaczę ukryty numer telefonu$/ do
end

Wtedy /^zobaczę link "([^"]*)"$/ do |arg1|
end

Wtedy /^licznik obejrzeń ogłoszenia zwiększy się o jeden$/ do
# visit '/' 
  # save_and_open_page
  page.should have_content "1"
end

