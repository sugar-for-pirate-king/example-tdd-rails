# frozen_string_literal: true

module Web
  class NotesController < ApplicationController
    before_action :require_login

    def index; end
  end
end
