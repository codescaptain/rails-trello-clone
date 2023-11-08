# frozen_string_literal: true

class ListsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_board, only: %i[new]

  def new
    @list = @board.lists.new
  end

  private

  def set_board
    @board = Board.find(params[:board_id])
  end
end
