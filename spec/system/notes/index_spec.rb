# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Notes Index', type: :system, js: true do
  context 'without authentication' do
    it 'redirect to new_login_path' do
      visit notes_path
      expect(page).to have_current_path new_login_path
    end
  end

  context 'with authentication' do
    it 'returns list of notes' do
      create(:note, title: 'Test-driven development di Rails')
      create(:note, title: 'Arsitektur Rails')
      user = create(:user, email: 'pquest@gmail.com')
      page.set_rack_session(user_id: user.id)
      visit notes_path
      notes = [
        'Test-driven development di Rails',
        'Arsitektur Rails'
      ]
      notes.each do |note_title|
        expect(page).to have_content note_title
      end
    end
  end
end
