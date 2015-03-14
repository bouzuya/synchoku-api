class ApplicationController < ActionController::Base
  before_filter :set_format

  def set_format
    render json: { status: 'error' }, status: :not_acceptable \
      unless request.format == 'json'
  end
end
