# frozen_string_literal: true

class BoardsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_board, only: [:edit]

  def new
    @board = Board.new
  end

  def create
    @board = Board.new(board_params.merge(user: current_user))
    if @board.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    authorize @board
  end

  private

  def set_board
    @board = Board.find(params[:id])
  end

  def board_params
    params.require(:board).permit(:name)
  end
end
