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

class Goal < ActiveRecord::Base
  validates :date, presence: true
  validates :token, presence: true
  validates :value, presence: true,
                    numericality: {
                      only_integer: true,
                      greater_than_or_equal_to: 0,
                      less_than_or_equal_to: 1000000000
                    }
  validates :visible, presence: true
end
