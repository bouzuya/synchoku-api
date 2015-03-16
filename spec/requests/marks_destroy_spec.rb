require 'rails_helper'

RSpec.describe 'goals#destroy', type: :request do
  let!(:goal) { create(:goal) }
  let!(:model) { create(:mark, goal: goal) }

  let!(:params) { nil }
  let!(:method) { :delete }
  let!(:path) { mark_path(model) }

  context 'without authorization header' do
    let!(:env) { nil }
    before { send(method, path, params, env) }
    subject { response }
    its(:status) { is_expected.to be 401 }
    its(:body) { is_expected.to match_json_expression(status: 'error') }
  end

  context 'with authorization header' do
    let!(:env) { authorization_headers }
    before { send(method, path, params, env) }
    subject { response }
    its(:status) { is_expected.to be 204 }
    its(:body) { is_expected.to be_empty }
  end
end
