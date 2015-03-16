require 'rails_helper'

RSpec.describe 'marks#index', type: :request do
  let!(:goal) { create(:goal) }
  let!(:mark1) { create(:mark, goal: goal) }
  let!(:mark2) { create(:mark, goal: goal) }

  let!(:params) { nil }
  let!(:method) { :get }
  let!(:path) { goal_marks_path(goal) }

  let!(:env) { nil }
  before { send(method, path, params, env) }
  subject { response }
  its(:status) { is_expected.to be 200 }
  its(:body) do
    is_expected.to match_json_expression([
      {
        id: mark1.id,
        goal_id: goal.id,
        date: mark1.date.iso8601,
        value: mark1.value
      },
      {
        id: mark2.id,
        goal_id: goal.id,
        date: mark2.date.iso8601,
        value: mark2.value
      }
    ])
  end
end
