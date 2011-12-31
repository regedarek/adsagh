# encoding: UTF-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
admin = Admin.create(:username => 'rege', :password => 'z', :email => 'rege@agh.pl')
ad1 = Ad.create(
								:title => 'Ogłoszenie niepotwierdzone',
								:name => 'Czesio1',
								:email => 'czesio@agh.pl',
								:ad_content =>'Lorem ipsum',
								:price => '4'
      )
ad2 = Ad.create(
								:name => 'Ogłoszenie niezweryfikowane',
								:title => 'Tytuł1',
								:name => 'Czesio1',
								:email => 'czesio@agh.pl',
								:ad_content =>'Lorem ipsum',
								:price => '4',
								:advertiser_id => 1
      )
ad3 = Ad.create(
								:name => 'Ogłoszenie potwierdzone i zweryfikowane',
								:title => 'Tytuł1',
								:name => 'Czesio1',
								:email => 'czesio@agh.pl',
								:ad_content =>'Lorem ipsum',
								:price => '4',
								:advertiser_id => 1,
								:verification_date => Time.now
      )
# advertiser = (:name => ad1.name, :email => ad1.email)
