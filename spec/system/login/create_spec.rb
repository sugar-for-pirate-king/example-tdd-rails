# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User login', type: :system do
  context 'with valid params' do
    it 'redirect to dashboard' do
      create(:user, email: 'pquest@mail.com', password: 'secret123')
      visit new_login_path
      fill_in :login_form_email, with: 'pquest@mail.com'
      fill_in :login_form_password, with: 'secret123'
      click_on 'Login'
      expect(page).to have_content 'Dashboard'
    end
  end

  context 'with invalid params' do
    it 'returns error message' do
      visit new_login_path
      fill_in :login_form_email, with: 'hacker@mail.com'
      fill_in :login_form_password, with: 'secret123'
      click_on 'Login'
      expect(page).to have_content 'Email or password was invalid'
    end
  end
end
