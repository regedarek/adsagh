# encoding: UTF-8
admin = Admin.create(:username => 'admin', :password => 'admin', :email => 'admin@agh.pl')
unad1 = Ad.create(
								:title => 'Ogłoszenie niepotwierdzone 1',
								:name => 'Czesio1',
								:email => 'czesio1@agh.pl',
                :category_id => 2,
                :ad_content =>'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris sed sapien ut elit bibendum lacinia vel ac neque. Etiam sapien lectus, tristique nec hendrerit id, posuere eget odio. Mauris tempus viverra justo feugiat suscipit.',
								:price => '44'
               )
unad2 = Ad.create(
								:title => 'Ogłoszenie niepotwierdzone 2',
								:name => 'Czesio2',
								:email => 'czesio2@agh.pl',
                :category_id => 2,
                :ad_content =>'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris sed sapien ut elit bibendum lacinia vel ac neque. Etiam sapien lectus, tristique nec hendrerit id, posuere eget odio. Mauris tempus viverra justo feugiat suscipit.',
								:price => '44'
               )
unad3 = Ad.create(
								:title => 'Ogłoszenie niepotwierdzone 3',
								:name => 'Czesio3',
								:email => 'czesio3@agh.pl',
                :category_id => 2,
                :ad_content =>'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris sed sapien ut elit bibendum lacinia vel ac neque. Etiam sapien lectus, tristique nec hendrerit id, posuere eget odio. Mauris tempus viverra justo feugiat suscipit.',
								:price => '44'
               )

unwad1 = Ad.create(
								:title => 'Ogłoszenie niezweryfikowane',
								:name => 'Czesio1',
								:email => 'czesio@agh.pl',
								:ad_content => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris sed sapien ut elit bibendum lacinia vel ac neque. Etiam sapien lectus, tristique nec hendrerit id, posuere eget odio. Mauris tempus viverra justo feugiat suscipit.',
								:price => '12',
                :category_id => 6,
								:advertiser_id => 1
               )
unwad2 = Ad.create(
								:title => 'Ogłoszenie niezweryfikowane',
								:name => 'Czesio1',
								:email => 'czesio@agh.pl',
								:ad_content => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris sed sapien ut elit bibendum lacinia vel ac neque. Etiam sapien lectus, tristique nec hendrerit id, posuere eget odio. Mauris tempus viverra justo feugiat suscipit.',
								:price => '12',
                :category_id => 6,
								:advertiser_id => 1
               )
pcad1 = Ad.create(
								:title => 'Ogłoszenie potwierdzone i zweryfikowane',
								:name => 'Czesio1',
								:email => 'czesio@agh.pl',
								:ad_content => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris sed sapien ut elit bibendum lacinia vel ac neque. Etiam sapien lectus, tristique nec hendrerit id, posuere eget odio. Mauris tempus viverra justo feugiat suscipit.',
								:price => '42',
								:advertiser_id => 1,
                :category_id => 7,
								:verification_date => Time.now
               )
advertiser = Advertiser.create(:name => 'Czesio1', :email => 'czesio@agh.pl')
cat1 = Category.create(:name => 'komputery')
cat2 = Category.create(:name => 'rowery')
cat3 = Category.create(:name => 'dyski', :ancestry => 1)
cat4 = Category.create(:name => 'akcesoria', :ancestry => 1)
cat5 = Category.create(:name => 'myszki', :ancestry => '1/4')
cat6 = Category.create(:name => 'zewnętrzne', :ancestry => '1/3')
cat7 = Category.create(:name => 'wewnętrzne', :ancestry => '1/3')
cat8 = Category.create(:name => 'hamulce', :ancestry => 2)
cat9 = Category.create(:name => 'koła', :ancestry => 2)
