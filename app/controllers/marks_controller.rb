class MarksController < ApplicationController
  before_action :set_goal, only: [:index]
  before_action :set_mark, only: [:show]

  def index
    @marks = @goal.marks
  end

  def show
  end

  private

  def set_goal
    @goal = Goal.find_by!(id: params[:goal_id])
  end

  def set_mark
    @mark = Mark.find_by!(id: params[:id])
  end
end
