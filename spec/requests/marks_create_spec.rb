require 'rails_helper'

RSpec.describe 'marks#create', type: :request do
  let!(:goal) { create(:goal) }

  let!(:params) { attributes_for(:mark) }
  let!(:method) { :post }
  let!(:path) { goal_marks_path(goal) }

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
    its(:status) { is_expected.to be 201 }
    its(:body) do
      is_expected.to match_json_expression(
        id: Numeric,
        goal_id: goal.id,
        date: params[:date].iso8601,
        value: params[:value]
      )
    end
  end
end
