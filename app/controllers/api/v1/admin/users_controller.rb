module Api
  module V1
    module Admin
      class UsersController < Api::V1::BaseController
        before_action :set_user, only: %i[show update destroy]
        before_action :require_admin, only: %i[create update destroy]

        def index
          @users = User.all
          render json: @users
        end

        def show
          render json: @user
        end
      
        def create
          @user = User.new(user_params)
      
          if @user.save
            render json: @user, status: :created, location: api_v1_admin_users_path(@user)
          else
            render json: @user.errors, status: :unprocessable_entity # 422
          end
        end

        def update
          if @user.update(user_params)
            render json: @user
          else
            render json: @user.errors, status: :unprocessable_entity
          end
        end

        def destroy
          @user.destroy!
        end
      
        private

        def require_admin
          render json: {message: "Unauthorized", status: 401} unless current_user.admin?
        end
      
        def user_params
          params.require(:user).permit(:name, :email, :password, :password_confirmation, :admin)
        end

        def set_user
          @user = User.find(params[:id])
        end
      end
    end
  end
end
