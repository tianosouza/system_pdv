FactoryBot.define do
  factory :user do
    name { |n| "Fulano_#{n} System Pdv" }
    sequence(:email) { |n| "fulano_#{n}00@pdvsystem.com" }
    password_digest { "123456" }
    password_confirmation { "123456" }
    role { "user" }
  end
end
