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

class Mark < ActiveRecord::Base
  belongs_to :goal

  validates :date, presence: true
  validates :goal, presence: true
  validates :value, presence: true,
                    numericality: {
                      only_integer: true,
                      greater_than_or_equal_to: 0,
                      less_than_or_equal_to: 1000000000
                    }
end
