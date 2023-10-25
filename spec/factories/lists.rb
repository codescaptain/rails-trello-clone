FactoryBot.define do
  factory :list do
    association :board
    sequence(:title) { |t| "My Title #{t}" }
    sequence(:class_list) { |t| "my_class#{t}" }
  end
end
