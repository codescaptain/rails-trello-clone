# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pundit::Authorization
  rescue_from ::ActiveRecord::RecordNotFound, with: :record_not_found

  def record_not_found(exception)
    render json: { error: exception.message }.to_json, status: 404
  end
end
