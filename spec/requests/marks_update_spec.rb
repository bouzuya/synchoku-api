require 'rails_helper'

RSpec.describe 'marks#update', type: :request do
  let!(:goal) { create(:goal) }
  let!(:model) { create(:mark, goal: goal) }

  let!(:params) do
    {
      id: model.id,
      goal_id: goal.id,
      date: model.date + 1.days,
      value: model.value + 1
    }
  end
  let!(:method) { :patch }
  let!(:path) { mark_path(model) }

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
        goal_id: params[:goal_id],
        date: params[:date].iso8601,
        value: params[:value]
      )
    end
  end
end
