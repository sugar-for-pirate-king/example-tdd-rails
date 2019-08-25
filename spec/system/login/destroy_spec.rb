# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User logout', type: :system do
  context 'with authentication' do
    it 'redirect to root_path' do
      user = create(:user)
      page.set_rack_session(user_id: user.id)
      visit notes_path
      click_on 'Logout'
      expect(page).to have_current_path root_path
      # Try to access authenticated page
      visit notes_path
      expect(page).to have_current_path new_login_path
    end
  end
end
