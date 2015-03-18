require 'rails_helper'

RSpec.describe 'marks#index', type: :request do
  let!(:goal1) { create(:goal, visible: false) }
  let!(:mark1) { create(:mark, goal: goal1) }
  let!(:mark2) { create(:mark, goal: goal1) }
  let!(:goal2) { create(:goal, visible: true) }
  let!(:mark3) { create(:mark, goal: goal2) }
  let!(:mark4) { create(:mark, goal: goal2) }

  let!(:params) { nil }
  let!(:method) { :get }
  let!(:path) { goal_marks_path(goal1) }


  context 'without authorization header' do
    let!(:env) { nil }

    context 'invisible goal' do
      let!(:path) { goal_marks_path(goal1) }
      before { send(method, path, params, env) }
      subject { response }
      it_behaves_like '401'
    end

    context 'visible goal' do
      let!(:path) { goal_marks_path(goal2) }
      before { send(method, path, params, env) }
      subject { response }
      its(:status) { is_expected.to be 200 }
      its(:body) do
        is_expected.to match_json_expression([
          {
            id: mark3.id,
            goal_id: mark3.goal_id,
            date: mark3.date.iso8601,
            value: mark3.value
          },
          {
            id: mark4.id,
            goal_id: mark4.goal_id,
            date: mark4.date.iso8601,
            value: mark4.value
          }
        ])
      end
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
          id: mark1.id,
          goal_id: mark1.goal_id,
          date: mark1.date.iso8601,
          value: mark1.value
        },
        {
          id: mark2.id,
          goal_id: mark2.goal_id,
          date: mark2.date.iso8601,
          value: mark2.value
        }
      ])
    end
  end
end
