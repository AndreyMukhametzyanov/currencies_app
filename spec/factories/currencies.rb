# frozen_string_literal: true

FactoryBot.define do
  factory :currency do
    sequence(:num_code) { |i| '777' * i }
    sequence(:char_code) { |i| 'MYC' * i }
    nominal { 100 }
    name { 'My Currency' }
    value { 12.12 }
  end
end
