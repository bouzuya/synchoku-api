require 'rails_helper'

RSpec.describe 'goals#create', type: :request do
  let!(:env) { nil }
  let!(:params) { attributes_for(:goal) }
  let!(:method) { :post }
  let!(:path) { goals_path }

  before { send(method, path, params, env) }
  subject { response }
  its(:status) { is_expected.to be 201 }
  its(:body) do
    is_expected.to match_json_expression(
      id: Numeric,
      date: params[:date].iso8601,
      token: params[:token],
      value: params[:value],
      visible: params[:visible]
    )
  end
end
