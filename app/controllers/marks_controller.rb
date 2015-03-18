class MarksController < ApplicationController
  before_action :set_goal, only: [:index, :create]
  before_action :set_mark, only: [:show, :update, :destroy]

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

  def destroy
    Mark.transaction do
      @mark.destroy!
    end
    head :no_content
  end

  private

  def mark_params
    params.permit(:date, :value)
  end

  def set_goal
    @goal = Goal.find_by!(id: params[:goal_id])
    # authorize resource
    return if @token
    return if @goal.token == params[:token]
    return if @goal.visible
    render_unauthorized
  end

  def set_mark
    @mark = Mark.find_by!(id: params[:id])
  end
end
