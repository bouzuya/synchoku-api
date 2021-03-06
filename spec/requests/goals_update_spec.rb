require 'rails_helper'

RSpec.describe 'goals#update', type: :request do
  let!(:model) { create(:goal) }
  let!(:params) do
    {
      id: model.id,
      date: model.date + 1.days,
      # token
      value: model.value + 1,
      visible: !model.visible
    }
  end
  let!(:method) { :patch }
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
    its(:status) { is_expected.to be 200 }
    its(:body) do
      is_expected.to match_json_expression(
        id: params[:id],
        date: params[:date].iso8601,
        token: String,
        value: params[:value],
        visible: params[:visible]
      )
    end
  end
end
