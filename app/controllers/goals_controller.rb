class GoalsController < ApplicationController
  before_action :set_goal, only: [:show, :update]

  def index
    @goals = Goal.all
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

  private

  def goal_params
    params.permit(:date, :token, :value, :visible)
  end

  def set_goal
    @goal = Goal.find_by!(id: params[:id])
  end
end
