require 'rails_helper'

RSpec.describe 'goals#destroy', type: :request do
  let!(:model) { create(:goal) }

  let!(:params) { nil }
  let!(:method) { :delete }
  let!(:path) { goal_path(model) }

  context 'without authorization header' do
    let!(:env) { nil }
    before { send(method, path, params, env) }
    subject { response }
    it_behaves_like '401'
  end

  context 'with authorization header' do
    let!(:env) { authorization_headers }
    before { send(method, path, params, env) }
    subject { response }
    its(:status) { is_expected.to be 204 }
    its(:body) { is_expected.to be_empty }
  end
end
