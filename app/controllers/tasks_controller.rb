class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_category
  before_action :set_task, only: [:show, :update, :destroy]

  # GET /categories/:category_id/tasks
  def index
    @tasks = @category.tasks
    render json: @tasks
  end

  # GET /categories/:category_id/tasks/1
  def show
    render json: @task
  end

  # POST /categories/:category_id/tasks
  def create
    @task = @category.tasks.build(task_params)

    if @task.save
      render json: @task, status: :created, location: [@category, @task]
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /categories/:category_id/tasks/1
  def update
    if @task.update(task_params)
      render json: @task
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  # DELETE /categories/:category_id/tasks/1
  def destroy
    @task.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = current_user.categories.find(params[:category_id])
    end

    def set_task
      @task = @category.tasks.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def task_params
      params.require(:task).permit(:title, :description, :completed)
    end
end
