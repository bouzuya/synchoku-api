require 'rails_helper'

RSpec.describe 'status#index', type: :request do
  let!(:env) { nil }
  let!(:params) { nil }
  let!(:method) { :get }
  let!(:path) { root_path }
  before { send(method, path, params, env) }
  subject { response }
  its(:status) { is_expected.to be 200 }
  its(:body) { is_expected.to match_json_expression(status: 'ok') }
end
