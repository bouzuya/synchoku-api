require 'rails_helper'

RSpec.describe 'marks#show', type: :request do
  let!(:goal) { create(:goal) }
  let!(:model) { create(:mark, goal: goal) }

  let!(:params) { nil }
  let!(:method) { :get }
  let!(:path) { mark_path(model) }

  let!(:env) { nil }
  before { send(method, path, params, env) }
  subject { response }
  its(:status) { is_expected.to be 200 }
  its(:body) do
    is_expected.to match_json_expression(
      id: model.id,
      goal_id: goal.id,
      date: model.date.iso8601,
      value: model.value
    )
  end
end
