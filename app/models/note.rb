# frozen_string_literal: true

class Note < ApplicationRecord
  validates :title, presence: true
end
