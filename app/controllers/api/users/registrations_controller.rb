# frozen_string_literal: true

module Api
  module Users
    class RegistrationsController < Devise::RegistrationsController
      respond_to :json
      protect_from_forgery with: :null_session, if: -> { request.format.json? }

      def create
        user = User.new(sign_up_params)

        if user.save
          token = user.generate_jwt
          render json: token.to_json
        else
          render json: { errors: { 'email or password' => ['is invalid'] } }, status: :unprocessable_entity
        end
      end

      private

      def sign_up_params
        params.require(:user).permit(:email, :password, :password_confirmation)
      end
    end
  end
end
