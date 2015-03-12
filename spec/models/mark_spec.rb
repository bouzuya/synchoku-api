# == Schema Information
#
# Table name: marks
#
#  id         :integer          not null, primary key
#  date       :datetime
#  goal_id    :integer
#  value      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_marks_on_goal_id  (goal_id)
#

require 'rails_helper'

RSpec.describe Mark, type: :model do
  describe '(factory)' do
    context ':mark_only' do
      subject { build(:mark_only) }
      it { is_expected.to_not be_valid }
    end

    context ':mark' do
      subject { build(:mark) }
      it { is_expected.to be_valid }
    end
  end

  describe '#date' do
    it { is_expected.to validate_presence_of(:date) }
  end

  describe '#goal' do
    it { is_expected.to belong_to(:goal) }
    it { is_expected.to validate_presence_of(:goal) }
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
end
