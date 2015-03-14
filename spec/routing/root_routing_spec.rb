require 'rails_helper'

RSpec.describe 'root', type: :routing do
  describe '_path helper' do
    context '#root_path' do
      subject { root_path }
      it { is_expected.to eq '/' }
    end
  end

  describe 'GET /' do
    subject { { get: root_path } }
    it { is_expected.to route_to(controller: 'status', action: 'index') }
  end
end
