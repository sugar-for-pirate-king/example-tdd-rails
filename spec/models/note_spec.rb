# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Note, type: :model do
  it 'is valid with title and body' do
    note = build(:note, title: 'Arsitektur Rails', body: 'konten dari arsitektur rails')
    note.valid?
    expect(note.errors).to be_blank
  end
end
