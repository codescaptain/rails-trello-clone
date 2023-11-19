# frozen_string_literal: true

module Api
  class ListsController < Api::ApplicationController
    before_action :set_board, only: :index

    def index
      if signed_in?
        render json: ListSerializer.new(@board.lists).serializable_hash.to_json, status: 200
      else
        render json: { data: [] }, status: 204
      end
    end

    private

    def set_board
      @board = Board.find(params[:board_id])
    end
  end
end
