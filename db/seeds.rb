# encoding: UTF-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
ad = Admin.create(:username => 'rege', :password => 'z', :email => 'd@d.pl')
category = Ad.create(:name => 'Ogłoszenie 1', :title => 'Tytuł1', :name => 'Czesio1', :email => 'czesio@agh.pl', :ad_content =>'Lorem ipsum', :price => '4')