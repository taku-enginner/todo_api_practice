module Api
  module V1
    class SessionsController < Api::V1::BaseController
      skip_before_action :login_required, only: %i[create]

      def create
        user = User.find_by(email: session_params[:email])
    
        if user&.authenticate(session_params[:password])
          session[:user_id] = user.id
          render json: {
            message: "Logged in successfully",
            status: 200
          }
        else
          render json: {
            message: "Invalid email or password",
            status: 401
          }
        end
      end
    
      def destroy
        reset_session
        render json: {
          message: "Logged out successfully",
          status: 200
        }
      end
    
      def session_params
        params.require(:session).permit(:email, :password)
      end
  end
  end
end
