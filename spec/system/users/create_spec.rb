# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User Registration', type: :system do
  it 'returns success message' do
    visit new_user_path
    fill_in :user_full_name, with: 'Kano minami'
    fill_in :user_email, with: 'kano@minami.com'
    fill_in :user_password, with: 'secret123'
    click_on 'Submit'
    expect(page).to have_content 'Registration has been succeed'
  end

  it 'returns error message' do
    visit new_user_path
    fill_in :user_full_name, with: ''
    fill_in :user_email, with: ''
    fill_in :user_password, with: ''
    click_on 'Submit'
    error_messages = [
      "Full name can't be blank",
      "Email can't be blank",
      "Password can't be blank"
    ]
    error_messages.each do |message|
      expect(page).to have_content message
    end
  end
end
