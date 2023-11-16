# spec/factories/clients.rb

FactoryBot.define do
  factory :client do
    email { "example@example.com" }
    full_name { "First Last" }
  end
end
