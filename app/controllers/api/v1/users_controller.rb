module Api
  module V1
    class UsersController < ApplicationController
      before_action :set_user: [:show, :update, :destroy]

      def index
        @users = User.all
        render json: @users
      end

      def show
        @user = User.find(params[:id])
        render json: { status: 'SUCCESS', data: @user }
      end

      def create
        user = User.new(user_params)
        if user.save
          render json: { status: 'SUCCESS', data: user }
        else
          render json: { status: 'ERROR', data: user.errors }
        end
      end

      def destroy
      end

      def update
      end

      private

      def set_user
        @user = User.find(params[:id])
      end

      def user_params
        params.require(:user).permit(:title)
      end

    end
  end
end
