FactoryGirl.define do
  factory :owner do
    name Faker::Name.first_name 
  end
end
