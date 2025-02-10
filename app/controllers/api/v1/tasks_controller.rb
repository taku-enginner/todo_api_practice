module Api
  module V1
    class TasksController < BaseController
      
      before_action :set_task, only: %i[ show update destroy ]
    
      # GET /tasks
      def index
        @tasks = current_user.tasks
    
        render json: @tasks
      end
    
      # GET /tasks/1
      def show
        render json: @task
      end
    
      # POST /tasks
      def create
        @task = current_user.tasks.new(task_params)
    
        if @task.save
          render json: @task, status: :created, location: api_v1_tasks_path(@task)
        else
          render json: @task.errors, status: :unprocessable_entity
        end
      end
    
      # PATCH/PUT /tasks/1
      def update
        if @task.update(task_params)
          render json: @task
        else
          render json: @task.errors, status: :unprocessable_entity
        end
      end
    
      # DELETE /tasks/1
      def destroy
        @task.destroy!
      end
    
      private
        # Use callbacks to share common setup or constraints between actions.
        def set_task
          @task = current_user.tasks.find(params[:id])
        end
    
        # Only allow a list of trusted parameters through.
        def task_params
          params.require(:task).permit(:title, :content)
        end


    end  
  end  
end
