class MarksController < ApplicationController
  before_action :set_goal, only: [:index]

  def index
    @marks = @goal.marks
  end

  private

  def set_goal
    @goal = Goal.find_by!(id: params[:goal_id])
  end
end
