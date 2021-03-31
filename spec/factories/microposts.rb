FactoryBot.define do
  factory :micropost do
    user_id {1}
    content {"#{"a"*200}"}
  end

end
