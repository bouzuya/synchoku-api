require 'rails_helper'

RSpec.describe 'goals#show', type: :request do
  let!(:env) { nil }
  let!(:params) { nil }
  let!(:method) { :get }
  let!(:path) { goal_path(model) }

  let!(:model) { create(:goal) }

  before { send(method, path, params, env) }
  subject { response }
  its(:status) { is_expected.to be 200 }
  its(:body) do
    is_expected.to match_json_expression(
      id: model.id,
      date: model.date,
      token: model.token,
      value: model.value,
      visible: model.visible
    )
  end
end
