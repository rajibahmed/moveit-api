FactoryGirl.define do
  factory :offer do
		email "example@email.com"
    distance 100
    attic 0
    celler 0
    has_piano true
  end
end
