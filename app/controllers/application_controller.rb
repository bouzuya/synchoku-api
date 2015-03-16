class ApplicationController < ActionController::Base
  before_filter :set_format
  before_filter :authenticate
  before_filter :authorize

  def set_format
    request.format = 'json'
  end

  def authenticate
    authenticate_with_http_token do |token, _options|
      @token = token if ENV['SYNCHOKU_TOKEN'] == token
    end
  end

  def authorize
    render json: { status: 'error' }, status: :unauthorized unless @token
  end
end
