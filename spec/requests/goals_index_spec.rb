require 'rails_helper'

RSpec.describe 'goals#index', type: :request do
  let!(:goal1) { create(:goal, visible: true) }
  let!(:goal2) { create(:goal, visible: false) }

  let!(:params) { nil }
  let!(:method) { :get }
  let!(:path) { goals_path }

  context 'without authorization header' do
    let!(:env) { nil }
    before { send(method, path, params, env) }
    subject { response }
    its(:status) { is_expected.to be 200 }
    its(:body) do
      is_expected.to match_json_expression([
        {
          id: goal1.id,
          date: goal1.date.iso8601,
          value: goal1.value,
          visible: goal1.visible
        }
      ])
    end
  end

  context 'with authorization header' do
    let!(:env) { authorization_headers }
    before { send(method, path, params, env) }
    subject { response }
    its(:status) { is_expected.to be 200 }
    its(:body) do
      is_expected.to match_json_expression([
        {
          id: goal1.id,
          date: goal1.date.iso8601,
          token: goal1.token,
          value: goal1.value,
          visible: goal1.visible
        },
        {
          id: goal2.id,
          date: goal2.date.iso8601,
          token: goal2.token,
          value: goal2.value,
          visible: goal2.visible
        }
      ])
    end
  end
end
