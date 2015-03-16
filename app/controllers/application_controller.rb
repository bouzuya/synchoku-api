class ApplicationController < ActionController::Base
  before_filter :set_format
  before_filter :authorize

  def set_format
    request.format = 'json'
  end

  def authorize
    return if authenticate_with_http_token do |token, _options|
      ENV['SYNCHOKU_TOKEN'] == token
    end
    render json: { status: 'error' }, status: :unauthorized
  end
end
