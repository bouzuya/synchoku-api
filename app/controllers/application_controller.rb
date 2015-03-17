class ApplicationController < ActionController::Base
  before_filter :set_format
  before_filter :authenticate
  before_filter :authorize_action

  def render_unauthorized
    render json: { status: 'error' }, status: :unauthorized
  end

  private

  def set_format
    request.format = 'json'
  end

  def authenticate
    authenticate_with_http_token do |token, _options|
      @token = token if ENV['SYNCHOKU_TOKEN'] == token
    end
  end

  def authorize_action
    action = controller_name + '#' + action_name
    available_actions = @token ? authorized_actions : unauthorized_actions
    return render_unauthorized unless available_actions.include? action
  end

  def unauthorized_actions
    %w(
      goals#index
      goals#show
      marks#index
      marks#show
      status#index
    )
  end

  def authorized_actions
    %w(
      goals#index
      goals#create
      goals#show
      goals#update
      goals#destroy
      marks#index
      marks#create
      marks#show
      marks#update
      marks#destroy
      status#index
    )
  end
end
