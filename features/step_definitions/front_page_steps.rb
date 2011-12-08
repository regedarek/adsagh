# encoding: UTF-8

# Kroki które mogą się przydać w innych scenariuszach
Wtedy /^pokaż mi stronę$/ do
	save_and_open_page
end

Jeżeli /^wejdę na stronę główną$/ do
	visit '/'
end

Wtedy /^chcę zobaczyć przycisk "([^"]*)"$/ do |arg1|
  page.should have_content arg1 
end

#Kroki tylko do obecnej funkcjonalności
Zakładając /^brak ogłoszeń w bazie danych$/ do
	Ad.find(:all).empty?
end

Wtedy /^zobaczę brak ogłoszeń w bazie$/ do
	page.should have_content "brak ogłoszeń w bazie"
end

Zakładając /^istnienie ogłoszeń w bazie danych$/ do
	Ad.create!(:title => "Nerka",
               :name => "Czesio",
               :email => "t@t.pl",
               :ad_content => "Sprzedam nerke nie smigana.",
               :phone_number => "662284020",
               :price => "5,43")
end

Wtedy /^zobaczę listę ogłoszeń$/ do
	page.should have_content "Nerka"
end
