# frozen_string_literal: true

module Api
  module V1
    class NotesController < ApplicationController
      before_action :require_login

      def index
        notes = Note.all
        render json: notes
      end

      def create
        # note = Note.new(note_params)
        # note.save
        render json: { message: 'Note has been created' }
      end

      private

      def note_params
        params.require(:note).permit(:title, :body)
      end
    end
  end
end
