FactoryGirl.define do
  factory :inbound_email do
    from 'bob@jones.com'
    to 'big@boy.com'
    subject 'big stuff'
    text 'mmmmmmm burgers'
  end
end