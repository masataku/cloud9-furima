FactoryBot.define do
  factory :comment do
    body {"コメントです"}
    
    association :user
    association :item
  end
end
