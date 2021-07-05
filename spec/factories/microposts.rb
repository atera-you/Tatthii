FactoryBot.define do
  factory :micropost do
    user_id {1}
    content {"blockquote class=#{"a"*183}"}
  end

end
