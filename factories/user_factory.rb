FactoryGirl.define do
  factory :user do |user|
    user.sequence(:email) {|n| "user#{n}@ticketee.com"}
    user.password 'P@ssw0rd'
    user.password_confirmation 'P@ssw0rd'
  end
end