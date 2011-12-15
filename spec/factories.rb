FactoryGirl.define do
	factory :admin do
		sequence(:username) { |n| "rege#{n}" }
		password "z"
		email { "#{username}@example.com"}
	end
end