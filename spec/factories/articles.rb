FactoryGirl.define do
  factory :article do
    sequence(:title) { |n| "A joke a day keeps the doctor away #{n}" }
    content 				"MyString A joke a day keeps the doctor away"
    excerpt 				"MyString A joke a day keeps the doctor away"
    image						Rack::Test::UploadedFile.new(Rails.root + 'spec/fixtures/spec.jpg', "image/jpeg")
    author_id				0 
    rate 						0
    view						1
  end
end
