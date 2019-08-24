# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Root page spec', type: :system do
  before do
    visit root_path
  end

  it 'returns title of web app' do
    expect(page).to have_content 'Example tdd-in-rails web app'
  end

  it 'returns daftar button' do
    expect(page).to have_link 'Daftar', href: new_user_path
  end

  it 'returns login button' do
    expect(page).to have_link 'Login', href: new_login_path
  end
end
