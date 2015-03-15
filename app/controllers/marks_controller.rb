class MarksController < ApplicationController
  before_action :set_goal, only: [:index, :create]
  before_action :set_mark, only: [:show, :update]

  def index
    @marks = @goal.marks
  end

  def create
    Mark.transaction do
      @mark = @goal.marks.create!(mark_params)
    end
    render :show, status: :created
  end

  def show
  end

  def update
    Mark.transaction do
      @mark.update!(mark_params)
    end
    render :show
  end

  private

  def mark_params
    params.permit(:date, :value)
  end

  def set_goal
    @goal = Goal.find_by!(id: params[:goal_id])
  end

  def set_mark
    @mark = Mark.find_by!(id: params[:id])
  end
end
