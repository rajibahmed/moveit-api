FactoryGirl.define do
  factory :offer do
		email "example@email.com"
    distance 100
		living_space 0
    attic 0
    celler 0
    has_piano true
  end
end
