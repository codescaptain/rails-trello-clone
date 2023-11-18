# frozen_string_literal: true

class ListsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_board, only: %i[new create edit]
  before_action :set_list, only: %i[edit]

  def new
    @list = @board.lists.new
  end

  def edit; end

  def create
    @list = @board.lists.new(list_params)
    if @list.save
      redirect_to board_path(@board)
    else
      render :new
    end
  end

  private

  def list_params
    params.require(:list).permit(:title, :class_list)
  end

  def set_board
    @board = Board.find(params[:board_id])
  end

  def set_list
    @list = List.find(params[:id])
  end
end
