class GoalsController < ApplicationController
  before_action :set_goal, only: [:show, :update, :destroy]
  before_action :set_goals, only: [:index]

  def index
  end

  def create
    Goal.transaction do
      @goal = Goal.create!(goal_params)
    end
    render :show, status: :created
  end

  def show
  end

  def update
    Goal.transaction do
      @goal.update!(goal_params)
    end
    render :show
  end

  def destroy
    Goal.transaction do
      @goal.destroy!
    end
    head :no_content
  end

  private

  def goal_params
    params.permit(:date, :value, :visible)
  end

  def set_goal
    @goal = Goal.find_by!(id: params[:id])
    # authorize resource
    return if @token
    return if @goal.token == params[:token]
    return if @goal.visible
    render_unauthorized
  end

  def set_goals
    @goals = Goal.all
    # authorize resource
    return if @token
    @goals = @goals.where(visible: true)
    return unless params[:token]
    @goals = @goals.concat @goals.where(token: params[:token])
  end
end
