require 'rails_helper'

RSpec.describe 'goals#show', type: :request do
  let!(:model) { create(:goal) }

  let!(:params) { nil }
  let!(:method) { :get }
  let!(:path) { goal_path(model) }

  context 'without authorization header' do
    let!(:env) { nil }
    before { send(method, path, params, env) }
    subject { response }
    its(:status) { is_expected.to be 200 }
    its(:body) do
      is_expected.to match_json_expression(
        id: model.id,
        date: model.date.iso8601,
        value: model.value,
        visible: model.visible
      )
    end
  end

  context 'without authorization header' do
    let!(:env) { authorization_headers }
    before { send(method, path, params, env) }
    subject { response }
    its(:status) { is_expected.to be 200 }
    its(:body) do
      is_expected.to match_json_expression(
        id: model.id,
        date: model.date.iso8601,
        token: model.token,
        value: model.value,
        visible: model.visible
      )
    end
  end
end
