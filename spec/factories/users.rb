FactoryBot.define do
  factory :user do
    name          {"arata"}
    sequence(:email, "rails@gmail.com") 
    password      {"password"}
    password_confirmation {"password"}
  end

end

