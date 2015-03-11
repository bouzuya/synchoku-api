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

FactoryGirl.define do
  factory :goal do
    date '2015-03-11 21:44:18'
    token 'token'
    value 1
    visible false
  end
end
