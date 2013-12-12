# == Schema Information
#
# Table name: dos
#
#  id         :integer          not null, primary key
#  completed  :boolean
#  priority   :integer
#  details    :string(255)
#  map        :string(255)
#  date       :date
#  list_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Do < ActiveRecord::Base
  belongs_to :list
end
