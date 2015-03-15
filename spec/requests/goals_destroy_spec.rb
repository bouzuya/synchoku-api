require 'rails_helper'

RSpec.describe 'goals#destroy', type: :request do
  let!(:model) { create(:goal) }

  let!(:env) { nil }
  let!(:params) { nil }
  let!(:method) { :delete }
  let!(:path) { goal_path(model) }

  before { send(method, path, params, env) }
  subject { response }
  its(:status) { is_expected.to be 204 }
  its(:body) { is_expected.to be_empty }
end
