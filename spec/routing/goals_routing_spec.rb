require 'rails_helper'

RSpec.describe 'goals', type: :routing do
  describe '_path helper' do
    context '#goals_path' do
      subject { goals_path }
      it { is_expected.to eq '/goals' }
    end

    context '#goal_path' do
      subject { goal_path(1) }
      it { is_expected.to eq '/goals/1' }
    end
  end

  describe 'GET /goals' do
    subject { { get: goals_path } }
    it { is_expected.to route_to(controller: 'goals', action: 'index') }
  end

  describe 'POST /goals' do
    subject { { post: goals_path } }
    it { is_expected.to route_to(controller: 'goals', action: 'create') }
  end

  describe 'GET /goals/:id' do
    subject { { get: goal_path(1) } }
    it { is_expected.to route_to(controller: 'goals', action: 'show', id: '1') }
  end

  describe 'PATCH /goals/:id' do
    subject { { patch: goal_path(1) } }
    it do
      is_expected.to route_to(
        controller: 'goals', action: 'update', id: '1')
    end
  end

  describe 'PUT /goals/:id' do
    subject { { put: goal_path(1) } }
    it do
      is_expected.to route_to(
        controller: 'goals', action: 'update', id: '1')
    end
  end

  describe 'DELETE /goals/:id' do
    subject { { delete: goal_path(1) } }
    it do
      is_expected.to route_to(
        controller: 'goals', action: 'destroy', id: '1')
    end
  end
end
