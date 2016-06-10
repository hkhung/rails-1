FactoryGirl.define do
	factory :user do
		sequence(:email) 		{|n| 'email#{n}@example.com'}	
		password 						'1234567'
		first_name 					'Jim'
		last_name 					'Futurez'
		image								Rack::Test::UploadedFile.new(Rails.root + 'spec/fixtures/spec.jpg', "image/jpeg")

		trait :with_article do |author|
    	transient do
    		articles_count 2
    	end

    	after(:create) do |author, evaluator|
    		create_list(:article, evaluator.articles_count, author: author) 
    	end
    end
	end
end