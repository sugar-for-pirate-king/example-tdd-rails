# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    full_name { 'MyString' }
    email { 'MyString' }
    password_digest { 'MyString' }
  end
end
