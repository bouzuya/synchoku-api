module AuthorizationHelpers
  def authorization_headers
    token = 'token'
    allow(ENV).to receive(:[]).with('SYNCHOKU_TOKEN').and_return(token)
    { Authorization: "Token token=#{token}" }
  end
end

RSpec.configure do |config|
  config.include AuthorizationHelpers
end
