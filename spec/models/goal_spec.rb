# == Schema Information
#
# Table name: goals
#
#  id         :integer          not null, primary key
#  date       :datetime
#  token      :string
#  value      :integer
#  visible    :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Goal, type: :model do
  describe '(factory)' do
    subject { create(:goal) }
    it { is_expected.to be_valid }
  end

  describe '#date' do
    it { is_expected.to validate_presence_of(:date) }
  end

  describe '#token' do
    it { is_expected.to validate_presence_of(:token) }
  end

  describe '#value' do
    it { is_expected.to validate_presence_of(:value) }
    it do
      is_expected.to validate_numericality_of(:value)
        .only_integer
        .is_greater_than_or_equal_to(0)
        .is_less_than_or_equal_to(1000000000)
    end
  end

  describe '#visible' do
    # NOTE: remove this test for warning from shoulda-matchers
    # it do
    #   is_expected.to validate_inclusion_of(:visible)
    #     .in_array([true, false])
    # end
  end
end
