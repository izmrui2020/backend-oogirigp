module Api
  module V1
    class UsersController < ApplicationController
      before_action :set_user: [:show, :update, :destroy]

      #userの認証をして成功したら、Userの情報を投げる。
      def index
        @users = User.all
        render json: @users
      end

      def show
        # @user = User.find(params[:id])
        # render json: { status: 'SUCCESS', data: @user }
      end

      def create
        newUser = User.new(user_params)

        if newUser.save
          render json: { status: 'SUCCESS', data: newUser }
        else
          render json: { status: 'ERROR', data: newUser.errors }
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
          params.require(:user).permit(
            :nickname, :avatar) #:image_cache, :remove_image)
        end

        def logged_in
          unless logged_in?
          end
        end
    end
  end
end
