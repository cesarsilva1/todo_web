# == Schema Information
#
# Table name: sharings
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  list_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Sharing < ActiveRecord::Base
  belongs_to :user
  belongs_to :list
end
