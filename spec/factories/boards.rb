# frozen_string_literal: true

FactoryBot.define do
  factory :board do
    sequence(:name) { |t| "Name #{t}" }
    association :user
  end
end
