module Api
  module V1
    class UsersController < ApplicationController
      before_action :set_user, only: [:show, :update, :destroy]

      #userの認証をして成功したら、Userの情報を投げる。
      def index
        @users = User.all
        render json: @users
      end

      def show
        authenticate!
        @user = User.find_by(username: params[:username])
        if @user.present?
          render json: { status: 'SUCCESS', data: @user }
        else
          create!
        end       
      end
      def create
        newUser = User.new(params[:username])
        if newUser.save
          render json: { status: 'SUCCESS', data: newUser }
        else
          render json: { status: 'ERROR', data: newUser.errors }
        end
      end

      def destroy
      end

      def update
        authenticate!
      end

      private
        def set_user
          @user = User.find(params[:id])
        end

        def user_params
          params.require(:user).permit(:nickname, :avatar)
          #:image_cache, :remove_image)require(:user)       
        end

        def logged_in
          
        end
    end
  end
end
