# frozen_string_literal: true

module Api
  module V1
    class NotesController < ApplicationController
      before_action :require_login

      def index
        notes = Note.all
        render json: notes
      end
    end
  end
end
