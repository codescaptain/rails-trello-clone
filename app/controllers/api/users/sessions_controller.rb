# frozen_string_literal: true

module Api
  module Users
    class SessionsController < Devise::SessionsController
      respond_to :json
      protect_from_forgery with: :null_session, if: -> { request.format.json? }

      def create
        user = User.find_by_email(sign_in_params[:email])
        if user&.valid_password?(sign_in_params[:password]) && user
          token = user.generate_jwt
          render json: { token: token.to_json }
        else
          render json: { errors: { 'email or password' => ['is invalid'] } }, status: :unprocessable_entity
        end
      end

      private

      def sign_in_params
        params.require(:user).permit(:email, :password)
      end
    end
  end
end
