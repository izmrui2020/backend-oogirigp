module Api
  module V1
    class UsersController < ApplicationController
      before_action :correct_user, only: [:check, :destroy, :edit]
      PER_PAGE = 5

      def check
        @user = User.find_by(username: check_param)
        if @user.present?
          render json: { status: 'SUCCESS', data: @user }
        else
          user_create!
        end       
      end
      

      def destroy
        User.find(params[:id]).destroy
      end

      def edit
        @user = User.find(params[:id])
        @user.update(user_params)
      end

      private
        def user_create
          newUser = User.new(params[:username])
          if newUser.save
            render json: { status: 'SUCCESS', data: newUser }
          else
            render json: { status: 'ERROR', data: newUser.errors }
          end
        end

        def check_param
          params.require(:user).permit(:username)
        end

        def user_params
          params.require(:user).permit(:username, :email, :nickname, :avatar)
          #:image_cache, :remove_image)require(:user)       
        end

        def correct_user
          authenticate! 
        end
    end
  end
end
