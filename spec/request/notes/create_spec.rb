# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Notes create spec', type: :request do
  context 'without authentication' do
    it 'returns error not authenticated' do
      post '/api/v1/notes'
      expect(response.body).to include "You're not authenticated"
    end
  end

  context 'with authentication' do
    it 'returns success message' do
      user = create(:user)
      stub_current_user_with(user)
      post '/api/v1/notes', params: {
        note: { title: 'Arsitektur Rails', body: 'Konten dari arsitektur rails' }
      }
      expect(response.body).to include 'Note has been created'
    end

    it 'returns error message' do
      user = create(:user)
      stub_current_user_with(user)
      post '/api/v1/notes', params: { note: { title: nil } }
      expect(response.body).to include "Title can't be blank"
    end
  end

  private

  def stub_current_user_with(user)
    allow_any_instance_of(Api::V1::ApplicationController).to receive(:current_user).and_return(user)
  end
end
