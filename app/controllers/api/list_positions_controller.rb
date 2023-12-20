module Api
  class ListPositionsController < Api::ApplicationController
    before_action :set_board, only: %i[ update]

    def update
      @lists = @board.lists
      ::Api::ListSortingService.new(@lists, params, @lists.find(params[:id]).position).call
    end

    private

    def set_board
      @board = Board.find(params[:board_id])
    end
  end
end