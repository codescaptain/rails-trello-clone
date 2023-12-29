# frozen_string_literal: true

class ItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_list, only: %i[new create]

  def new
    @item = @list.items.new
  end

  def create
    @item = @list.items.new(item_params)

    if @item.save
      redirect_to board_path(@list.board)
    else
      redirect_to board_path(@list.board)
    end
  end

  private

  def set_list
    @list = List.find(params[:list_id])
  end

  def item_params
    params.require(:item).permit(:title, :description)
  end

end