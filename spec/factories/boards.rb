# frozen_string_literal: true

FactoryBot.define do
  factory :board do
    name { 'MyString' }
    association :user
  end
end
