# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Notes index API', type: :request do
  context 'without authentication' do
    it 'returns not authenticated error message' do
      get '/api/v1/notes'
      expect(response.body).to include "You're not authenticated"
    end
  end

  context 'with authentication' do
    it 'returns list of notes data' do
      create(:note, title: 'Arsitektur Rails')
      create(:note, title: 'Cheetsheet active record')
      user = create(:user)
      stub_current_user_with(user)
      get '/api/v1/notes'
      expect(response.body).to include 'Arsitektur Rails', 'Cheetsheet active record'
    end
  end

  private

  def stub_current_user_with(user)
    allow_any_instance_of(Api::V1::ApplicationController).to receive(:current_user).and_return(user)
  end
end
