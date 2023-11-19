# frozen_string_literal: true

module Api
  class ApplicationController < ActionController::API
    respond_to :json
    before_action :process_token

    def authenticate_user!(_options = {})
      head :unauthorized unless signed_in?
    end

    def signed_in?
      @current_user_id.present?
    end

    def current_user
      @current_user ||= super || User.find(@current_user_id)
    end

    def process_token
      return unless request.headers['Authorization'].present?

      begin
        @current_user_id = jwt_payload['id']
      rescue JWT::ExpiredSignature, JWT::VerificationError, JWT::DecodeError
        head :unauthorized
      end
    end

    def jwt_payload
      JWT.decode(request.headers['Authorization'].split(' ')[1].remove('"'),
                 Rails.application.secrets.secret_key_base).first
    end
  end
end
