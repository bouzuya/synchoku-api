require 'rails_helper'

RSpec.describe 'marks', type: :routing do
  describe '_path helper' do
    context '#goal_marks_path' do
      subject { goal_marks_path(goal_id: 1) }
      it { is_expected.to eq '/goals/1/marks' }
    end

    context '#mark_path' do
      subject { mark_path(1) }
      it { is_expected.to eq '/marks/1' }
    end
  end

  describe 'GET /goals/1/marks' do
    subject { { get: goal_marks_path(goal_id: 1) } }
    it do
      is_expected.to route_to(
        controller: 'marks', action: 'index', goal_id: '1')
    end
  end

  describe 'POST /goals/1/marks' do
    subject { { post: goal_marks_path(goal_id: 1) } }
    it do
      is_expected.to route_to(
        controller: 'marks', action: 'create', goal_id: '1')
    end
  end

  describe 'GET /marks/:id' do
    subject { { get: mark_path(1) } }
    it do
      is_expected.to route_to(controller: 'marks', action: 'show', id: '1')
    end
  end

  describe 'PATCH /marks/:id' do
    subject { { patch: mark_path(1) } }
    it do
      is_expected.to route_to(
        controller: 'marks', action: 'update', id: '1')
    end
  end

  describe 'PUT /marks/:id' do
    subject { { put: mark_path(1) } }
    it do
      is_expected.to route_to(
        controller: 'marks', action: 'update', id: '1')
    end
  end

  describe 'DELETE /marks/:id' do
    subject { { delete: mark_path(1) } }
    it do
      is_expected.to route_to(
        controller: 'marks', action: 'destroy', id: '1')
    end
  end
end
