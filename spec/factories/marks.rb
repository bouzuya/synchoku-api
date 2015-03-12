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

FactoryGirl.define do
  factory :mark_only, class: :mark do
    date "2015-03-12 14:36:55"
    value 1
    goal nil

    factory :mark do
      after(:build) do |m|
        m.goal ||= create(:goal)
      end
    end
  end
end
