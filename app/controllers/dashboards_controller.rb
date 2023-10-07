# frozen_string_literal: true

class DashboardsController < ApplicationController
  before_action :authenticate_user!

  def index
    @boards = Board.order(created_at: :desc)
  end
end
