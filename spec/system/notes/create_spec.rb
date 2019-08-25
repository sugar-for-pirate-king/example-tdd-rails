# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Create Note', type: :system, js: true do
  context 'without authentication' do
    it 'redirect_to new_login_path' do
      visit new_note_path
      expect(page).to have_current_path new_login_path
    end
  end

  context 'with authentication' do
    before do
      user = create(:user)
      page.set_rack_session(user_id: user.id)
      visit new_note_path
    end

    it 'returns success message' do
      fill_in :note_title, with: 'Arsitektur Rails'
      fill_in :note_body, with: 'Kostum arsitektur rails'
      click_on 'Submit'
      expect(page).to have_content 'Note has been created'
    end

    it 'returns back to note list link' do
      expect(page).to have_link 'Back to note list'
    end
  end
end
