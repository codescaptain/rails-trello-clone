# frozen_string_literal: true

module Api
  class ListsController < Api::ApplicationController
    before_action :set_board, only: :index

    def index
      render json: ListSerializer.new(@board.lists).serializable_hash.to_json, status: 200
    end

    private

    def set_board
      @board = Board.find(params[:board_id])
    end
  end
end
