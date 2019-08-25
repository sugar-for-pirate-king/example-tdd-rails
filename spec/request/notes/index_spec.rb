# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Notes index API', type: :request do
  context 'without authentication' do
    it 'returns not authenticated error message' do
      get '/api/v1/notes'
      expect(response.body).to include "You're not authenticated"
    end
  end
end
