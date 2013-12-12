# == Schema Information
#
# Table name: lists
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  color      :string(255)
#  shared     :boolean
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class List < ActiveRecord::Base
  belongs_to :user
  has_many :dos
  has_many :sharings

end
