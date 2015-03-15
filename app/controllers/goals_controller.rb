class GoalsController < ApplicationController
  before_action :set_goal, only: [:show]

  def index
    @goals = Goal.all
  end

  def show
  end

  private

  def set_goal
    @goal = Goal.find_by!(id: params[:id])
  end
end
