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

RSpec.describe Mark, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
